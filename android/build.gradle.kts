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
subprojects {
    afterEvaluate {
        extensions.findByName("android")?.withGroovyBuilder {
            val namespaceAtual = getProperty("namespace") as String?
            if (namespaceAtual.isNullOrEmpty()) {
                setProperty("namespace", "pt.cuidarpt.patch.${project.name.replace("-", "_").replace(".", "_")}")
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
