## Introduction

*Comic Book Reader* est un programme C++ pour lire les fichiers de bandes dessinées *.cbr* ou *.cbz*. Il utilise la technologie *qml* de *Qt* pour créer l'interface graphique, la bibliothèque *OpenCV* pour traiter les images et *unarr* pour extraire des fichiers spécifiques du fichier cbr/cbz vers la mémoire.

## Dépendances
- unarr

  Cette librairie est utilisée pour l'extraction de fichiers.

- OpenCV

  Cette librairie est utilisée pour le traitement d'image.

- Qt5.x

  On utilise le QML et QtQuick de Qt5.x pour l'interface graphique.

## Comment compiler en Windows
### Prérequis

- Qt creater, MSVC x64 de Qt5.x, Visual Studio 2019

- OpenCV-3.x : [le lien](https://opencv.org/releases/)
- unarr : [le lien](https://github.com/selmf/unarr)
- cmake : [le lien](https://cmake.org/download/)

### Etapes

- Pour OpenCV

  - Télécharger OpenCV-3.x de version Windows (par ex. `opencv-3.4.16-vc14_vc15.exe`) et l'exécuter pour compiler cette module.
  - A priori, on obtenir des fichiers `*.h` dans les répertoires `build/include/opencv` et `build/include/opencv2`, on les copie dans le répertoire `3dparts\include\opencv`
  - On a des fichiers `*.lib` (par ex. `opencv_world3415.lib`) dans le répertoire `build\x64\vc15\lib`, on les copie dans le répertoire `3dparts\lib\opencv`. Ensuite, on modifie la configuration dans le fichier `ComicBookReader.pro` sur OpenCV, on modifie le nom de lib au nom correspondant. (par ex. `-lopencv_world3415`)
  - De plus, on a aussi des fichiers `*.dll` dans le répertoire `build\x64\vc15\bin`

- Pour unarr

  - Télécharger unarr d'un projet sur `github`, et le compiler dans un répertoire par ex. `build` : Dans le `powershell`, on entre le répertoire où on place unarr

    ```powershell
    cd unarr
    mkdir build ; cd build
    cmake ..
    ```

  - On a donc le fichier `unarr.vcxproj`, on l'ouvre avec Visual Studio 2019 et le compiler pour avoir `unarr.lib` et `unarr.dll`

  - On copie `unarr.h` dans le répertoire `3dparts\include\unarr` et `unarr.lib` dans le répertoire `3dparts\lib\unarrlib`

- Compiler le projet avec Qt Creator
- *S'il y a des erreurs comme "\*.dll n'est pas trouvé", on copie le `*.dll` correspondant dans le répertoire de l'application.*
