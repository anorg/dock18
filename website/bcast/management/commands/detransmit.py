from django.core.management.base import BaseCommand, CommandError
from bcast.models import Event

class Command(BaseCommand):
    args = '<event_id event_id ...>'
    help = 'Closes the specified poll for voting'

    def handle(self, *args, **options):
        for event_id in args:
            try:
                event = Event.objects.get(pk=int(event_id))
            except Event.DoesNotExist:
                raise CommandError('Event "%s" does not exist' % event_id)

            event.transmission = False
            event.save()

            self.stdout.write('Successfully de-transmitted "%s"\n' % event_id)