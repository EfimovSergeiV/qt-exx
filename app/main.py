# This Python file uses the following encoding: utf-8
import os
import sys
from pathlib import Path
from PySide2.QtWidgets import QApplication
from PySide2.QtQml import QQmlApplicationEngine


if __name__ == "__main__":
    app = QApplication([])
    engine = QQmlApplicationEngine()
    engine.load(os.fspath(Path(__file__).resolve().parent / "src/main.qml"))
    sys.exit(app.exec_())
