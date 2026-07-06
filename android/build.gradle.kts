allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

// Alguns pacotes mais antigos (ex.: isar_flutter_libs, cujo autor original
// abandonou o projeto) não declaram "namespace" no seu build.gradle, algo
// que o Android Gradle Plugin 8+ passou a exigir sempre. Isto atribui um
// namespace a qualquer subprojeto que não tenha um definido, sem precisar
// de alterar o pacote em si.
//
// O evaluationDependsOn(":app") acima força alguns subprojetos a avaliar
// mais cedo do que o normal, por isso não podemos assumir que nenhum ainda
// está por avaliar — testamos o estado antes de decidir entre corrigir já
// ou esperar pelo afterEvaluate.
fun patchNamespaceSeNecessario(proj: Project) {
    proj.extensions.findByName("android")?.withGroovyBuilder {
        val namespaceAtual = getProperty("namespace") as String?
        if (namespaceAtual.isNullOrEmpty()) {
            setProperty("namespace", "pt.cuidarpt.patch.${proj.name.replace("-", "_").replace(".", "_")}")
        }
    }
}

subprojects {
    if (state.executed) {
        patchNamespaceSeNecessario(this)
    } else {
        afterEvaluate { patchNamespaceSeNecessario(this) }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
