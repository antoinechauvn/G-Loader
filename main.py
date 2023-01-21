# This Python file uses the following encoding: utf-8
import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from extension import Extension
from handler import Handler
from model import HabboList
from intercepter import RoomIntercepter
from pathlib import Path


ext = Extension(silent=True)
handler = Handler(extension=ext)
handler.bind()
habbolist = HabboList()
intercepter = RoomIntercepter(extension=ext, userlist=habbolist)


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    qml_file = Path(__file__).resolve().parent / "main.qml"

    engine.rootContext().setContextProperty("userContainer", habbolist)
    
    # Starting G-Loader
    ext.start()
    #Starting Qml Engine
    engine.load(qml_file)
    
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec())
