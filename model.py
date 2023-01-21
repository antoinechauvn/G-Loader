from PySide6.QtCore import QObject, Signal


class HabboList(QObject):
    append = Signal(str, str, arguments=['name', 'url'])
    clear = Signal()
    remove = Signal(int, arguments=['index'])

    def __init__(self) -> None:
        super().__init__()

    def list_append(self, username, avatar_url):
        self.append.emit(username, avatar_url)

    def list_remove(self, index):
        self.remove.emit(index)

    def list_clear(self):
        self.clear.emit()