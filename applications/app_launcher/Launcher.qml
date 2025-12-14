// shell.qml (або ваш основний QML-файл для лаунчера)
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

PanelWindow {
    Keys.onEscapePressed: Qt.quit() // або launcher.close()
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive
    ColumnLayout {
        // ...

        TextField { // У вашому прикладі був TextInput, але TextField частіше використовується в Quickshell прикладах.
            id: input
            Layout.fillWidth: true
            placeholderText: "Run…"

            // --- КЛЮЧОВЕ: Встановлення фокусу для вводу тексту ---
            focus: true

            // Додатковий обробник для реалізації логіки лаунчера (фільтрація, вибір)
            onTextChanged:
            // ... логіка фільтрації
            {}

            // Запобігаємо перехопленню важливих клавіш
            Keys.forwardTo: input

            // ... (Ваше оформлення)
        }

        // ... (ListView для результатів пошуку)
    }
}
