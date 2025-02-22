# READY_ME
This project is a Flutter-based application that demonstrates how to control 3D animated models using both keyboard inputs on desktop platforms and on-screen buttons on mobile platforms. The application utilizes the o3d package to render 3D models and allows users to interact with the models through various controls.

## Features
- 3D Model Rendering: Render expressive 3D robot models using the o3d package.

- Animation Control: Control animations using keyboard inputs on desktop platforms and on-screen buttons on mobile platforms.

- Platform-Specific UI: Display keyboard guides for desktop platforms and game controllers for mobile platforms.

- Camera Controls: Adjust camera orbit and target for better viewing angles.

- Dynamic Model Reloading: Reload models dynamically to reset animations and states.



## Getting Started
## Prerequisites
## Flutter SDK: Install Flutter

## Installation
- Clone the repository:
- git clone https://github.com/misterbrown3404/ready_me_animation.git cd robot-animation-controller

- Install dependencies:
- flutter pub get

- Run the app:
- flutter run

## Usage

## Desktop Platforms
- Use the following keyboard keys to control the animations:

- W: Run

- S: Punch

- A: Yes

- D: No

- Arrow Up: Jump

- Arrow Down: Dance

- Arrow Left: Idle

- Arrow Right: Death

## Mobile Platforms
- Use the on-screen game controllers to control the animations.

## Code Structure
- main.dart: Entry point of the application.

- MyHomePage.dart: Main widget that sets up the UI and handles input.

- GameController.dart: Custom widget that displays on-screen buttons for mobile platforms.

- o3d_controller.dart: Controller for managing 3D model animations.

## Contributing
Contributions are welcome! Please follow these steps:

- Fork the repository.

- Create a new branch (git checkout -b feature-branch).

- Make your changes and commit (git commit -m 'Add new feature').

- Push to the branch (git push origin feature-branch).

- Open a Pull Request.

- License
## This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
Thanks to the Flutter and o3d package communities for their amazing tools and support.
