#coding: utf-8
from __future__ import unicode_literals, absolute_import

from django.db import models
from django.utils.translation import ugettext_lazy as _

__all__ = ['SocrBase']


class SocrBase(models.Model):

    class Meta:
        app_label = 'fias'
        index_together = (
            ('level', 'scname'),
        )
        ordering = ['level', 'scname']

    level = models.PositiveSmallIntegerField(_('level'))
    scname = models.CharField(max_length=10, default=" ")
    socrname = models.CharField(max_length=50, default=" ")
    kod_t_st = models.PositiveIntegerField(primary_key=True)

    item_weight = models.PositiveSmallIntegerField(default=64)
    position = models.SmallIntegerField(default=0, verbose_name=u'Позиция, 0 - Слева, 1 - Справа')

    def __unicode__(self):
        return self.socrname

