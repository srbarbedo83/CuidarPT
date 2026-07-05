# CuidarPT — Plano da V1 (Flutter, Android, 100% local)

> Documento de planeamento. Sem código de app ainda — só decisões de
> arquitetura, modelos de dados e packages, para aprovação antes de começar a
> implementação funcionalidade a funcionalidade.

## 0. Nome

**CuidarPT** é claro, descritivo e comunica bem o propósito (cuidados a
pessoas idosas, mercado português). Alternativas consideradas: *ZeloSénior*,
*CuidaSénior*, *Amparo* — nenhuma é claramente melhor. Recomenda-se manter
**CuidarPT**.

## Restrições obrigatórias (recapitulação)

- Só Android por agora.
- Sem backend e sem servidor próprio — nada de Firebase/Supabase.
- Todos os dados de cuidado ficam exclusivamente no armazenamento local do
  telemóvel (Isar).
- Fotos/documentos guardados na pasta privada de documentos da app.
- Android Auto Backup nativo (`allowBackup`) para backup na conta Google do
  utilizador.
- Notificações de lembrete locais, agendadas no dispositivo.
- Sem anúncios, em nenhum plano.
- Sem condicionar funcionalidades a deixar avaliação na Play Store — trial de
  7 dias de Premium automático e incondicional para todos os novos
  utilizadores, com pedido de avaliação via `in_app_review` (nunca como
  bloqueio).

## 1. Estrutura de pastas do projeto Flutter

Estrutura **feature-first** (por funcionalidade, não por camada técnica).
Com 8 funcionalidades relativamente independentes, agrupar por domínio
mantém UI + estado + lógica de cada funcionalidade junta, e torna mais fácil
implementar "função a função" sem saltar entre pastas dispersas por tipo de
ficheiro.

```
lib/
  main.dart                       # bootstrap: Isar, timezone, notificações, trial check
  app.dart                        # MaterialApp, tema, rotas, localizações pt_PT

  core/
    theme/                        # cores, tipografia (texto grande, público 60+)
    constants/                    # enums partilhados, chaves
    services/
      notification_service.dart   # agendamento/cancelamento de lembretes locais
      pdf_report_service.dart     # geração do relatório PDF
      backup_service.dart         # exportação/importação manual (.isar/.json)
      billing_service.dart        # Google Play Billing (in_app_purchase)
      subscription_service.dart   # lógica trial/premium, feature flags
      weather_service.dart        # previsão do tempo (IPMA)
      alerts_service.dart         # avisos meteorológicos oficiais (IPMA) — Premium
    utils/

  data/
    local/
      idoso_schema.dart
      medicacao_schema.dart
      consulta_schema.dart
      cuidado_diario_schema.dart
      subscricao_schema.dart
      info_local_cache_schema.dart
      isar_provider.dart

  features/
    onboarding/
    idosos/                       # criar/editar/listar perfis
    medicacao/
    consultas/
    cuidados_diarios/
    relatorios/                   # ecrã de geração/partilha de PDF
    definicoes/                   # perfis, subscrição, backup manual
    subscricao/                   # paywall, ecrã trial/premium
    info_local/                   # dashboard de tempo (grátis) + avisos (Premium)

  shared/
    widgets/                      # botões, cards, empty states reutilizáveis
```

## 2. Modelo de dados (Isar collections)

**Idoso**
`id, nome, fotoPath?, dataNascimento, contactoEmergenciaNome,
contactoEmergenciaTelefone, notas (alergias/condições), concelho
(para previsão do tempo/avisos), criadoEm, atualizadoEm`

**RegistoMedicacao**
`id, idosoId (link), nomeMedicamento, dose, unidade, horarios (List<int>
minutos-do-dia), diasSemana (List<int>, vazio = diário), dataInicio,
dataFim?, notificacaoIds (List<int>, para cancelar depois), ativo (bool),
notas?`

**RegistoConsulta**
`id, idosoId (link), especialidade, local (texto livre — sugestões: "Centro
de Saúde/SNS", "Hospital", "Clínica privada"), data, hora, notas?,
proximaConsultaData?, notificacaoId?, lembreteAtivo (bool)`

**RegistoCuidadoDiario**
`id, idosoId (link), tipo (enum: Higiene, Alimentação, Humor, Sono, Outro),
notaRapida?, humorNivel? (1-5, só se tipo=Humor), timestamp`

**EstadoSubscricao** (registo único)
`id (singleton), trialInicio, trialFim, plano (enum Free/Premium),
premiumExpiraEm?, produtoPlayStoreId?, ultimaValidacaoCompra?`

Nota de risco: sem backend, a data de início do trial vive só no dispositivo
— reinstalar a app "reinicia" o trial. Limitação aceite pela restrição de
"sem servidor meu"; não há forma limpa de evitar sem backend.

**InfoLocalCache** (uma entrada por concelho consultado)
`id, concelhoCodigoIpma, previsaoJson (últimos dias, sempre acessível),
avisosJson (avisos oficiais ativos — só exposto se Premium), atualizadoEm`

## 3. Packages

| Necessidade | Package | Justificação |
|---|---|---|
| Base de dados local | `isar` + `isar_flutter_libs` + `isar_generator` (dev) | Suporta *links* nativos (Idoso→Medicação/Consulta/Cuidado), queries e índices sem SQL manual. Mais indicado que Hive quando há relações entre entidades e queries por intervalo de datas (necessárias para os relatórios PDF por período). |
| Notificações locais | `flutter_local_notifications` + `timezone` + `flutter_timezone` | Lembretes recorrentes agendados no dispositivo, sem push server. |
| Fotos/anexos | `image_picker` + `path_provider` | Guardar em `getApplicationDocumentsDirectory()`, pasta privada da app. |
| Estado | `flutter_riverpod` | Boa testabilidade, integração fácil com Isar via providers. |
| PDF | `pdf` + `printing` | `pdf` gera o documento; `printing` trata pré-visualização e integra com `share_plus`. |
| Partilha | `share_plus` | Partilhar o PDF gerado via WhatsApp/email. |
| Google Play Billing | `in_app_purchase` (+ `in_app_purchase_android`) | Plugin oficial Flutter/Google, sem intermediário de terceiros — mantém o espírito "sem backend meu". |
| Avaliação da app | `in_app_review` | API oficial da Google — diálogo nativo de avaliação sem forçar nem condicionar funcionalidades. |
| Datas/plurais PT-PT | `intl` + `flutter_localizations` | Formatação de datas/horas em português europeu. |
| Info da app | `package_info_plus` | Versão da app no ecrã de Definições. |
| Tempo/avisos oficiais | `http` | Chamadas diretas à API pública do IPMA (`api.ipma.pt`) — sem chave, dados abertos. |
| Deteção de rede | `connectivity_plus` | Mostrar estado "sem ligação" e usar a última previsão em cache. |
| Verificação periódica de avisos (Premium) | `workmanager` | Verificar avisos oficiais em segundo plano e disparar notificação local quando surge um aviso laranja/vermelho relevante para o concelho do idoso. |
| Gráficos (opcional) | `fl_chart` | Tendência simples de humor nos cuidados diários. |
| IDs auxiliares | `uuid` | IDs externos (ex. nomes de ficheiro de anexos); o Isar já gera os seus próprios `id` internos. |

Não se inclui `shared_preferences` — a `EstadoSubscricao` no Isar já cobre o
necessário, mantendo uma única fonte de verdade.

## 4. Feature flag grátis/premium

Um único ponto de decisão, não checks espalhados pelo código:

- `subscription_service.dart` expõe um Riverpod provider `isPremiumProvider`
  (bool), calculado a partir do `EstadoSubscricao`: `true` se
  `plano == Premium && !expirado`, **ou** se o trial ainda está a decorrer.
- Uma classe `FeatureLimits` expõe os limites concretos derivados desse
  estado: `maxPerfisIdoso`, `permitePdfPersonalizado`,
  `permiteHistoricoIlimitado`, `permiteExportacaoManual`,
  `permiteAvisosOficiais`. Evita `if (isPremium)` repetido por todo o lado —
  mudar as regras do plano passa a ser uma alteração num único sítio.
- A **previsão do tempo é sempre visível** (não passa por `FeatureLimits`);
  os **avisos meteorológicos oficiais** só são mostrados quando
  `permiteAvisosOficiais == true` — mesma fonte de dados (IPMA), dois
  níveis de acesso.
- UI: um widget `PremiumGate` genérico que envolve uma ação/ecrã premium e
  mostra um upsell (não um bloqueio agressivo) quando o limite é atingido —
  ex. ao tentar criar o 2º perfil de idoso no plano grátis, ou ao tentar
  ver os avisos oficiais sem Premium.
- Fica pronto desde o dia 1 mesmo antes do Play Billing estar ligado: no
  início, `plano` fica sempre `Free` após o trial, e o Billing real é só o
  que passa a poder mudar esse valor.

## 5. Funcionalidades da V1 (ordem de prioridade)

1. Onboarding simples + início automático do trial de 7 dias
2. Criar/editar perfil do idoso (inclui concelho de residência)
3. Registo de medicação com lembretes locais recorrentes
4. Registo de consultas médicas com lembretes
5. Registo de cuidados diários (higiene, alimentação, humor) com nota rápida
6. Geração de relatório em PDF (período configurável), partilhável via
   `share_plus`
7. Ecrã de definições: gestão de perfis (bloqueado a 1 no plano grátis) e
   estado da subscrição/trial
8. **Informação útil da zona**: previsão do tempo (IPMA, sempre grátis) +
   avisos meteorológicos oficiais (IPMA, calor/frio extremo etc. — Premium),
   com notificação local quando surge um aviso laranja/vermelho relevante

## 6. Alternativas consideradas e descartadas

- **Hive** em vez de Isar — mais simples, mas sem relações nativas nem
  índices; com 5 entidades ligadas a "Idoso" e queries por período para os
  relatórios, Isar poupa código manual.
- **sqflite/drift** — mais controlo SQL, mais boilerplate de migrações para
  o tamanho desta app.
- **Firebase Cloud Messaging** para lembretes — rejeitado: exige
  backend/servidor, viola a restrição explícita.
- **GetX / Bloc** em vez de Riverpod — GetX tem menos garantias em tempo de
  compilação; Bloc traz cerimónia desnecessária para uma app deste porte.
- **RevenueCat** para gerir subscrições — simplifica reconciliação de
  compras, mas introduz um serviço de terceiros a processar dados de compra
  fora do controlo do projeto; contraria o espírito "sem servidor meu".
  Optou-se pelo `in_app_purchase` oficial, aceitando que a validação de
  recibo fica só local (sem verificação server-side).
- **Bloquear funcionalidades a troco de avaliação na Play Store** —
  descartado: viola a política da Google e arrisca suspensão da app.
  Substituído por trial de 7 dias incondicional + `in_app_review` nativa,
  disparada num momento de valor percebido (ex. depois de gerar o 1º
  relatório PDF), nunca como bloqueio.
- **ANEPC/PROCIV (avisos tipo "ocorrências")** — para o continente não há
  uma API JSON simples e estável (só os Açores têm API própria de alertas).
  Adiado para uma fase futura; os avisos meteorológicos do IPMA já cobrem
  calor/frio extremo, que é o risco de saúde mais relevante para idosos.
- **QualAr (qualidade do ar) na V1** — dados oficiais existem, mas sem API
  REST simples e bem documentada (mais datasets/CSV/geo-serviços INSPIRE).
  Adiado; a viabilidade técnica precisa de validação antes de comprometer
  prioridade de roteiro.

## 7. Riscos técnicos e de política da Play Store

- **Data Safety form**: mesmo sem transmitir dados de cuidado, a app trata
  informação de saúde (medicação, consultas) — preencher com rigor "nenhum
  dado de cuidado recolhido/partilhado, tudo local"; a chamada à API do
  IPMA (tempo/avisos) é tráfego de rede que também deve ser declarado
  (sem dados pessoais enviados, só o código do concelho).
- **Privacy Policy obrigatória**: exigida mesmo para apps quase-offline,
  sobretudo por lidar com dados de saúde de terceiros (o idoso).
- **Permissões runtime (Android 13+)**: `POST_NOTIFICATIONS` e
  `READ_MEDIA_IMAGES`, pedidas em contexto.
- **Alarmes exatos**: lembretes de medicação idealmente usam
  `SCHEDULE_EXACT_ALARM`/`USE_EXACT_ALARM`; a Google restringe cada vez mais
  esta permissão — usar `AndroidScheduleMode.exactAllowWhileIdle` com
  fallback inexato, e justificar bem na submissão (lembretes de saúde).
- **Android Auto Backup**: confirmar via `dataExtractionRules`/
  `fullBackupContent` que só os ficheiros do Isar e anexos relevantes são
  incluídos.
- **Google Play Billing**: Billing Library atual (v6+) por trás do
  `in_app_purchase`; produtos de subscrição configurados na Play Console;
  termos claros de cancelamento no ecrã de subscrição.
- **In-App Review API**: tem quota — a Google não garante que o diálogo
  aparece sempre. Complementar com um botão manual nas Definições ("Ajuda a
  divulgar") que abre a ficha da app na Play Store.
- **App "Health"-adjacent**: incluir disclaimer de que a app é uma
  ferramenta de registo/organização, não presta aconselhamento médico nem é
  dispositivo médico certificado.
- **Target API level**: manter `targetSdkVersion` atualizado.
- **Uso do IPMA**: dados abertos, reutilizáveis livremente com indicação da
  fonte — cumprir essa atribuição na UI (ex. "Dados: IPMA").
- **RGPD**: público português está sob RGPD; mesmo com dados de cuidado
  100% locais, comunicar isso claramente ao utilizador é também um
  argumento de venda junto de cuidadores preocupados com privacidade de
  dados de saúde de familiares.
