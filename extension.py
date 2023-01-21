from g_python.gextension import Extension


class Extension(Extension):
    def __init__(self, silent=False):
        self.extension_info = {
            "title": "G-Loader",
            "description": "g_python test",
            "version": "1.0",
            "author": "Armanta"
            }

        self.extension_settings = {
            "use_click_trigger": False,
            "can_leave": True,
            "can_delete": True
            }

        self.args = ["-p", 9092]

        super().__init__(self.extension_info, self.args, self.extension_settings, silent)

