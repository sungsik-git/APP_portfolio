pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven( "https://jitpack.io" )

        //kakao login
        maven( "https://devrepo.kakao.com/nexus/content/groups/public/")
    }
}

rootProject.name = "OTTGIT"
include(":app")
