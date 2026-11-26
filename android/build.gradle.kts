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
// Perbaikan UAS/Modul 12: plugin geocoding_android masih memakai compileSdk 33,
// padahal dependensi AndroidX-nya butuh minimal 34. Semua plugin dipaksa memakai 36.
subprojects {
    afterEvaluate {
        if (name != "app") {
            val ext = extensions.findByName("android")
            if (ext != null) {
                val attempts = listOf(
                    "setCompileSdkVersion" to Int::class.javaPrimitiveType!!,
                    "setCompileSdk" to Int::class.javaObjectType,
                )
                for ((method, type) in attempts) {
                    try {
                        ext.javaClass.getMethod(method, type).invoke(ext, 36)
                        break
                    } catch (_: Exception) {
                    }
                }
            }
        }
    }
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
