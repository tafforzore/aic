lancer la commande, n'oublier pas de verifier que la racine du projet est bien Tp332
# docker build -f Dockerfile -t flutter_docker .

[//]: # (// To install:)

[//]: # (pub global activate get_cli)

[//]: # (// &#40;to use this add the following to system PATH: [FlutterSDKInstallDir]\bin\cache\dart-sdk\bin)

[//]: # ()
[//]: # (flutter pub global activate get_cli)

[//]: # ()
[//]: # (// To create a flutter project in the current directory:)

[//]: # (// Note: By default it will take the folder's name as project name)

[//]: # (// You can name the project with `get create project:my_project`)

[//]: # (// If the name has spaces use `get create project:"my cool project"`)

[//]: # (get create project)

[//]: # ()
[//]: # (// To generate the chosen structure on an existing project:)

[//]: # (get init)

[//]: # ()
[//]: # (// To create a page:)

[//]: # (// &#40;Pages have controller, view, and binding&#41;)

[//]: # (// Note: you can use any name, ex: `get create page:login`)

[//]: # (// Nota: use this option if the chosen structure was Getx_pattern)

[//]: # (get create page:home)

[//]: # ()
[//]: # (// To create a screen)

[//]: # (// &#40;Screens have controller, view, and binding&#41;)

[//]: # (// Note: you can use any name, ex: `get screen page:login`)

[//]: # (// Nota: use this option if the chosen structure was CLEAN &#40;by Arktekko&#41;)

[//]: # (get create screen:home)

[//]: # ()
[//]: # (// To create a new controller in a specific folder:)

[//]: # (// Note: you don't need to reference the folder,)

[//]: # (// Getx will search automatically for the home folder)

[//]: # (// and add your controller there.)

[//]: # (get create controller:dialogcontroller on home)

[//]: # ()
[//]: # (// To create a new view in a specific folder:)

[//]: # (// Note: you don't need to reference the folder,)

[//]: # (// Getx will automatically search for the home folder)

[//]: # (// and insert your view there.)

[//]: # (get create view:dialogview on home)

[//]: # ()
[//]: # (// To create a new provider in a specific folder:)

[//]: # (get create provider:user on home)

[//]: # ()
[//]: # (// To generate a localization file:)

[//]: # (// Note: 'assets/locales' directory with your translation files in json format)

[//]: # (get generate locales assets/locales)

[//]: # ()
[//]: # (// To generate a class model:)

[//]: # (// Note: 'assets/models/user.json' path of your template file in json format)

[//]: # (// Note: on  == folder output file)

[//]: # (// Getx will automatically search for the home folder)

[//]: # (// and insert your class model there.)

[//]: # (get generate model on home with assets/models/user.json)

[//]: # ()
[//]: # (//to generate the model without the provider)

[//]: # (get generate model on home with assets/models/user.json --skipProvider)

[//]: # ()
[//]: # (//Note: the URL must return a json format)

[//]: # (get generate model on home from "https://api.github.com/users/CpdnCristiano")

[//]: # ()
[//]: # (// To install a package in your project &#40;dependencies&#41;:)

[//]: # (get install camera)

[//]: # ()
[//]: # (// To install several packages from your project:)

[//]: # (get install http path camera)

[//]: # ()
[//]: # (// To install a package with specific version:)

[//]: # (get install path:1.6.4)

[//]: # ()
[//]: # (// You can also specify several packages with version numbers)

[//]: # ()
[//]: # (// To install a dev package in your project &#40;dependencies_dev&#41;:)

[//]: # (get install flutter_launcher_icons --dev)

[//]: # ()
[//]: # (// To remove a package from your project:)

[//]: # (get remove http)

[//]: # ()
[//]: # (// To remove several packages from your project:)

[//]: # (get remove http path)

[//]: # ()
[//]: # (// To update CLI:)

[//]: # (get update)

[//]: # (// or `get upgrade`)

[//]: # ()
[//]: # (// Shows the current CLI version:)

[//]: # (get -v)

[//]: # (// or `get -version`)

[//]: # ()
[//]: # (// For help)

[//]: # (get help)
