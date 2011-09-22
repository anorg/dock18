# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Season'
        db.create_table('bcast_season', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('date_start', self.gf('django.db.models.fields.DateTimeField')()),
            ('date_end', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('bcast', ['Season'])

        # Adding model 'Event'
        db.create_table('bcast_event', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('title', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('Season', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bcast.Season'])),
            ('date_start', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2011, 9, 20, 12, 25, 55, 224717))),
            ('date_end', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2011, 9, 20, 12, 25, 55, 224762))),
            ('picture', self.gf('django.db.models.fields.files.ImageField')(default=False, max_length=100, blank=True)),
            ('transmission', self.gf('django.db.models.fields.BooleanField')(default=False)),
            ('key', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('created', self.gf('django.db.models.fields.DateTimeField')(auto_now_add=True, blank=True)),
            ('updated', self.gf('django.db.models.fields.DateTimeField')(auto_now=True, blank=True)),
        ))
        db.send_create_signal('bcast', ['Event'])

        # Adding model 'EventPlugin'
        db.create_table('cmsplugin_eventplugin', (
            ('cmsplugin_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['cms.CMSPlugin'], unique=True, primary_key=True)),
            ('event', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bcast.Event'])),
        ))
        db.send_create_signal('bcast', ['EventPlugin'])

        # Adding model 'EventPlugin_'
        db.create_table('cmsplugin_eventplugin_', (
            ('cmsplugin_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['cms.CMSPlugin'], unique=True, primary_key=True)),
        ))
        db.send_create_signal('bcast', ['EventPlugin_'])

        # Adding model 'EventListPlugin'
        db.create_table('cmsplugin_eventlistplugin', (
            ('cmsplugin_ptr', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['cms.CMSPlugin'], unique=True, primary_key=True)),
            ('size', self.gf('django.db.models.fields.CharField')(default='m', max_length=2)),
            ('limit', self.gf('django.db.models.fields.IntegerField')(default=8)),
        ))
        db.send_create_signal('bcast', ['EventListPlugin'])

        # Adding model 'Clip'
        db.create_table('bcast_clip', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
            ('path', self.gf('django.db.models.fields.files.FileField')(max_length=100)),
        ))
        db.send_create_signal('bcast', ['Clip'])

        # Adding model 'Playlist'
        db.create_table('bcast_playlist', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal('bcast', ['Playlist'])

        # Adding model 'ClipPlaylist'
        db.create_table('bcast_clipplaylist', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('playlist', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bcast.Playlist'])),
            ('clip', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['bcast.Clip'])),
            ('position', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal('bcast', ['ClipPlaylist'])


    def backwards(self, orm):
        
        # Deleting model 'Season'
        db.delete_table('bcast_season')

        # Deleting model 'Event'
        db.delete_table('bcast_event')

        # Deleting model 'EventPlugin'
        db.delete_table('cmsplugin_eventplugin')

        # Deleting model 'EventPlugin_'
        db.delete_table('cmsplugin_eventplugin_')

        # Deleting model 'EventListPlugin'
        db.delete_table('cmsplugin_eventlistplugin')

        # Deleting model 'Clip'
        db.delete_table('bcast_clip')

        # Deleting model 'Playlist'
        db.delete_table('bcast_playlist')

        # Deleting model 'ClipPlaylist'
        db.delete_table('bcast_clipplaylist')


    models = {
        'bcast.clip': {
            'Meta': {'object_name': 'Clip'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'path': ('django.db.models.fields.files.FileField', [], {'max_length': '100'})
        },
        'bcast.clipplaylist': {
            'Meta': {'ordering': "['position']", 'object_name': 'ClipPlaylist'},
            'clip': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['bcast.Clip']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'playlist': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['bcast.Playlist']"}),
            'position': ('django.db.models.fields.IntegerField', [], {})
        },
        'bcast.event': {
            'Meta': {'ordering': "('-date_start',)", 'object_name': 'Event'},
            'Season': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['bcast.Season']"}),
            'created': ('django.db.models.fields.DateTimeField', [], {'auto_now_add': 'True', 'blank': 'True'}),
            'date_end': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2011, 9, 20, 12, 25, 55, 224762)'}),
            'date_start': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2011, 9, 20, 12, 25, 55, 224717)'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'key': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'picture': ('django.db.models.fields.files.ImageField', [], {'default': 'False', 'max_length': '100', 'blank': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'transmission': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'updated': ('django.db.models.fields.DateTimeField', [], {'auto_now': 'True', 'blank': 'True'})
        },
        'bcast.eventlistplugin': {
            'Meta': {'object_name': 'EventListPlugin', 'db_table': "'cmsplugin_eventlistplugin'", '_ormbases': ['cms.CMSPlugin']},
            'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'limit': ('django.db.models.fields.IntegerField', [], {'default': '8'}),
            'size': ('django.db.models.fields.CharField', [], {'default': "'m'", 'max_length': '2'})
        },
        'bcast.eventplugin': {
            'Meta': {'object_name': 'EventPlugin', 'db_table': "'cmsplugin_eventplugin'", '_ormbases': ['cms.CMSPlugin']},
            'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'}),
            'event': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['bcast.Event']"})
        },
        'bcast.eventplugin_': {
            'Meta': {'object_name': 'EventPlugin_', 'db_table': "'cmsplugin_eventplugin_'", '_ormbases': ['cms.CMSPlugin']},
            'cmsplugin_ptr': ('django.db.models.fields.related.OneToOneField', [], {'to': "orm['cms.CMSPlugin']", 'unique': 'True', 'primary_key': 'True'})
        },
        'bcast.playlist': {
            'Meta': {'object_name': 'Playlist'},
            'clips': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['bcast.Clip']", 'through': "orm['bcast.ClipPlaylist']", 'symmetrical': 'False'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        'bcast.season': {
            'Meta': {'object_name': 'Season'},
            'date_end': ('django.db.models.fields.DateTimeField', [], {}),
            'date_start': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        },
        'cms.cmsplugin': {
            'Meta': {'object_name': 'CMSPlugin'},
            'creation_date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'language': ('django.db.models.fields.CharField', [], {'max_length': '15', 'db_index': 'True'}),
            'level': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'lft': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'parent': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.CMSPlugin']", 'null': 'True', 'blank': 'True'}),
            'placeholder': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['cms.Placeholder']", 'null': 'True'}),
            'plugin_type': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'}),
            'position': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True', 'blank': 'True'}),
            'rght': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'}),
            'tree_id': ('django.db.models.fields.PositiveIntegerField', [], {'db_index': 'True'})
        },
        'cms.placeholder': {
            'Meta': {'object_name': 'Placeholder'},
            'default_width': ('django.db.models.fields.PositiveSmallIntegerField', [], {'null': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'slot': ('django.db.models.fields.CharField', [], {'max_length': '50', 'db_index': 'True'})
        },
        'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'taggit.tag': {
            'Meta': {'object_name': 'Tag'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'slug': ('django.db.models.fields.SlugField', [], {'unique': 'True', 'max_length': '100', 'db_index': 'True'})
        },
        'taggit.taggeditem': {
            'Meta': {'object_name': 'TaggedItem'},
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'taggit_taggeditem_tagged_items'", 'to': "orm['contenttypes.ContentType']"}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'object_id': ('django.db.models.fields.IntegerField', [], {'db_index': 'True'}),
            'tag': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'taggit_taggeditem_items'", 'to': "orm['taggit.Tag']"})
        }
    }

    complete_apps = ['bcast']
