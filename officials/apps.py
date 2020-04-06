from django.apps import AppConfig


class OfficialsConfig(AppConfig):
    name = 'officials'

    def ready(self):
        import officials.signals
