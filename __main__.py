# This Python file uses the following encoding: utf-8
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from extension import Extension
from handler import Handler
from model import HabboList
from intercepter import RoomIntercepter
from pathlib import Path
from PySide6.QtCore import QTimer

def check_closed():
    if ext.is_closed():
        sys.exit()

def display():
    try:
        window = engine.rootObjects()[0]
    except:
        engine.load(qml_file)
    else:
        window.setVisible(not window.isVisible())


ext = Extension(args=sys.argv, silent=True)
habbolist = HabboList()
intercepter = RoomIntercepter(extension=ext, userlist=habbolist)
print("ui")
if __name__ == "__main__":
    app = QGuiApplication()
    engine = QQmlApplicationEngine()
    qml_file = Path(__file__).resolve().parent / "main.qml"

    engine.rootContext().setContextProperty("userContainer", habbolist)
    
    # Starting G-Loader
    ext.start()

    # Start checking if extension is closed every second
    timer = QTimer()
    timer.timeout.connect(check_closed)
    timer.start(1000)

    handler = Handler(extension=ext, engine=engine)
    handler.loadQMLSignal.connect(display)
    handler.bind()
    sys.exit(app.exec())
