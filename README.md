# airplane_price

Un nuevo proyecto en Flutter.

## Introducción

Este proyecto es un punto de partida para una aplicación Flutter.

Algunas referencias útiles para comenzar con Flutter:

- [Lab: Escribe tu primera aplicación en Flutter](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Ejemplos útiles en Flutter](https://docs.flutter.dev/cookbook)

Para obtener ayuda con el desarrollo en Flutter, visita la
[documentación en línea](https://docs.flutter.dev/), donde encontrarás tutoriales, ejemplos, guías sobre desarrollo móvil y una referencia completa de la API.

## Instalación

Para este proyecto se usaron las siguientes versiones

- `DevTools 2.28.5`
- `Flutter 3.16.9`
- `Dart 3.2.6`

Asegúrate de tener Flutter instalado en tu sistema. Puedes verificarlo con el siguiente comando:

```sh
flutter --version
```

Para instalar las dependencias, ejecuta:

```sh
flutter pub get
```

## Dependencias adicionales

Este proyecto incluye las siguientes dependencias adicionales que no vienen por defecto en un nuevo proyecto de Flutter:

| Paquete                  | Versión  | Descripción | Instalación |
|--------------------------|-----------|-------------|--------------|
| flutter_riverpod         | ^2.4.9    | Manejo de estado basado en Riverpod. | `flutter pub add flutter_riverpod` |
| riverpod_annotation      | ^2.3.3    | Anotaciones para usar Riverpod con generación de código. | `flutter pub add riverpod_annotation` |
| dio                      | ^5.4.0    | Cliente HTTP avanzado para Dart. | `flutter pub add dio` |
| dartz                    | ^0.10.1   | Programación funcional en Dart. | `flutter pub add dartz` |
| intl                     | ^0.17.0   | Manejo de internacionalización y fechas. | `flutter pub add intl` |
| freezed_annotation       | ^2.0.0    | Anotaciones para clases inmutables con `freezed`. | `flutter pub add freezed_annotation` |
| dropdown_button2         | ^2.3.9    | Un dropdown personalizado para Flutter. | `flutter pub add dropdown_button2` |
| cupertino_icons          | ^1.0.2    | Iconos estilo iOS. | `flutter pub add cupertino_icons` |
| lottie                   | ^3.1.3    | Soporte para animaciones Lottie en Flutter. | `flutter pub add lottie` |
| flutter_launcher_icons   | ^0.13.1   | Personaliza los íconos de la aplicación. | `flutter pub add flutter_launcher_icons` |

### Dependencias de desarrollo

| Paquete                 | Versión  | Descripción | Instalación |
|-------------------------|-----------|-------------|--------------|
| build_runner           | ^2.4.6    | Herramienta para generación de código. | `flutter pub add build_runner --dev` |
| freezed                | ^2.0.0    | Generador de clases inmutables. | `flutter pub add freezed --dev` |
| riverpod_generator     | ^2.3.3    | Generador de código para Riverpod. | `flutter pub add riverpod_generator --dev` |
| flutter_lints          | ^2.0.0    | Conjunto de reglas de linting recomendadas. | `flutter pub add flutter_lints --dev` |

## Comandos para importación
```sh
flutter pub add flutter_riverpod
flutter pub add riverpod_annotation
flutter pub add dio
flutter pub add dartz
flutter pub add intl
flutter pub add freezed_annotation
flutter pub add dropdown_button2
flutter pub add cupertino_icons
flutter pub add lottie
flutter pub add flutter_launcher_icons
flutter pub add build_runner --dev
flutter pub add freezed --dev
flutter pub add riverpod_generator --dev
flutter pub add flutter_lints --dev
```

## Configuración de Iconos

Para generar los íconos de la aplicación, usa el siguiente comando:

```sh
flutter pub run flutter_launcher_icons:main
```

## Recursos Estáticos

Este proyecto incluye los siguientes archivos en la carpeta `assets/lottie/`:

- `splash.json`
- `splash_2.json`
- `loading.json`

Para asegurarte de que los activos sean cargados correctamente, revisa el archivo `pubspec.yaml` y verifica que la sección de `assets` los incluya.

---

Si tienes alguna pregunta o sugerencia, no dudes en contactarme. 🚀


