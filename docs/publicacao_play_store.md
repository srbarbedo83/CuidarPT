# Guia de publicação do CuidarPT na Play Store

Este documento junta tudo o que falta do lado da Play Console (fora do
código) para publicares o CuidarPT: a conta de developer, os produtos de
subscrição, o formulário de Segurança de Dados e os passos finais de
envio.

## 1. Conta de developer Google Play

1. Cria/usa uma conta Google e regista-te em https://play.google.com/console/signup (taxa única de 25 USD).
2. **Importante**: se esta for uma conta nova, a Google exige que a app
   passe por **teste fechado com pelo menos 20 testers, durante 14 dias
   seguidos**, antes de poderes publicar em produção. Vale a pena
   começares este teste o mais cedo possível (podes usar familiares/amigos
   como testers) — corre em paralelo com o resto desta lista.

## 2. Criar a app na Play Console

1. "Criar app" → nome "CuidarPT" → idioma predefinido "Português (Portugal)" → app grátis.
2. Categoria: escolhe **"Estilo de vida"** (evita entrar no escrutínio mais apertado da política de apps "Médicas").
3. Público-alvo: adultos (não dirigido a crianças).

## 3. Ícone e imagens da loja

Já preparados no repositório, pasta `store_assets/`:

- `icone_play_store_512x512.png` — ícone da app (512×512, sem cantos arredondados pré-aplicados, como a Play exige).
- `grafico_destaque_1024x500.png` — gráfico de destaque ("feature graphic").

Ainda precisas de:

- **Capturas de ecrã** (mínimo 2, recomendado 4–8) — tira-as a correr a app num telemóvel Android real ou emulador, nos ecrãs mais representativos (perfil do idoso, medicação, sinais vitais, relatório).
- **Descrição curta** (até 80 caracteres) — sugestão: *"Organiza medicação, consultas e cuidados de quem mais importa."*
- **Descrição completa** (até 4000 caracteres) — usa o texto do `README.md`/`PLANEAMENTO.md` como ponto de partida, e inclui uma frase clara do género: *"O CuidarPT é uma ferramenta de organização de cuidados e não substitui aconselhamento, diagnóstico ou tratamento médico profissional."*

## 4. Política de privacidade

1. O texto já está pronto em `docs/privacidade.html`.
2. Publica-o via **GitHub Pages**: no repositório, `Settings` → `Pages` → em "Build and deployment", escolhe `Deploy from a branch`, branch `main`, pasta `/docs`. Guarda.
3. Ao fim de 1–2 minutos, a página fica disponível em:
   `https://srbarbedo83.github.io/CuidarPT/privacidade.html`
   (é exatamente o URL que já está ligado no botão "Política de privacidade" em Definições da app.)
4. Cola esse URL no campo "Política de privacidade" da Play Console (App content → Privacy policy).

## 5. Formulário de Segurança de Dados (Data Safety)

Em App content → Data safety. Como a app é 100% local (sem servidor
próprio, sem analítica, sem publicidade), as respostas são simples:

- **A tua app recolhe ou partilha algum dos tipos de dados de utilizador exigidos?**
  → **Sim**, a app *armazena* dados no dispositivo, mas não os *recolhe* (envia) para nenhum servidor. No fluxo do formulário:
  - "Esta app recolhe ou partilha algum destes tipos de dados?" — podes assinalar **"Nenhum dado é recolhido"** desde que confirmes que nada sai do dispositivo, o que é o caso aqui (sem exceção, mesmo as fotos ficam só no telemóvel).
  - Se preferires ser mais explícito por precaução, podes declarar os tipos abaixo como **"processados no dispositivo, não enviados"**:
    - Fotos (documentos, refeições, foto de perfil)
    - Informação de saúde (sinais vitais, medicação, notas)
    - Nome/contactos (contactos de emergência, profissionais)
    - Endereço de email (opcional, só se o utilizador o inserir no onboarding)
- **É toda a informação recolhida encriptada em trânsito?** → Não aplicável (não há trânsito de dados).
- **Os utilizadores podem pedir a eliminação dos dados?** → Sim, apagando o perfil/registo na app, ou desinstalando a app (que apaga tudo, já que não há cópia em servidor).
- **Publicidade e finalidade comercial** → Sem publicidade, sem partilha com terceiros, sem finalidade de marketing.

## 6. Classificação de conteúdo (IARC)

Preenche o questionário em App content → Content ratings. Para uma app
deste género (organização de cuidados, sem conteúdo violento/sexual/
apostas), a classificação típica é **"Livre para todos"** — responde com
honestidade a cada pergunta do questionário automático.

## 7. Produtos de subscrição (Premium)

Em Monetização → Produtos → Subscrições, cria exatamente estes 3 produtos
(o ID tem de corresponder **exatamente** ao que já está no código, em
`lib/features/subscricao/services/produtos_premium.dart`):

| ID do produto | Preço sugerido | Periodicidade |
|---|---|---|
| `cuidarpt_premium_mensal` | 1,99 € | Mensal |
| `cuidarpt_premium_semestral` | 9,99 € | De 6 em 6 meses |
| `cuidarpt_premium_anual` | 19,99 € | Anual |

Depois de criados e ativos, a app já os vai buscar automaticamente (ecrã
"Subscrever Premium" em Definições) — não é preciso mexer em código.

**Testar a compra**: adiciona o teu email como "License tester" em
Configurações → Testes de licença, para poderes comprar sem seres
cobrado a sério enquanto testas.

## 8. Ficheiro assinado (.aab)

A Play Store exige um Android App Bundle assinado. No PC (`C:\CuidarPT`):

```
flutter build appbundle --release
```

O ficheiro fica em `build/app/outputs/bundle/release/app-release.aab`.
Na primeira submissão, deixa a Play Console gerar e gerir a assinatura
por ti (Play App Signing) — é a opção recomendada e mais simples.

## 9. Ordem sugerida

1. Ativa GitHub Pages (passo 4) — 5 minutos.
2. Cria a conta de developer e a app na Play Console (passos 1–2).
3. Preenche Data Safety, classificação de conteúdo, política de privacidade (passos 5, 6, 4).
4. Cria os produtos de subscrição (passo 7).
5. Tira as capturas de ecrã e escreve as descrições (passo 3).
6. Gera o `.aab` (passo 8) e sobe-o a um **teste fechado** com pelo menos 20 testers.
7. Ao fim dos 14 dias de teste, promove para produção.
