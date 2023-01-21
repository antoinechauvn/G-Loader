class Handler:
    def __init__(self, extension) -> None:
        self.extension = extension
        self.version = 1

    def bind(self):
        self.extension.on_event('init', self.on_extension_init)
        self.extension.on_event('connection_start', self.on_connection_start)
        self.extension.on_event('connection_end', self.on_connection_end)

    def on_connection_start(self):
        print(f"Starting connection: G-Handler Version {self.version}")

    def on_connection_end(self):
        print(f"Ending connection: G-Handler Version {self.version}")

    def on_extension_init(self):
        print(f"Initializing G-Loader: G-Handler Version {self.version}")
