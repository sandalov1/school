from django.db import models


class DenbNedeli(models.Model):
    id_denb_nedeli = models.AutoField(db_column='id_Denb_Nedeli', primary_key=True)
    denb_nedeli = models.CharField(verbose_name='День недели', db_column='Denb_Nedeli', max_length=45)

    class Meta:
        managed = False
        db_table = 'denb_nedeli'
        ordering = ['id_denb_nedeli']
        verbose_name='День недель'
        verbose_name_plural='Дни недели'

    def __str__(self):
        return self.denb_nedeli


class Kabinet(models.Model):
    id_kabinet = models.IntegerField(db_column='id_Kabinet', primary_key=True)
    kabinet = models.CharField(verbose_name='Номер кабинета', db_column='Kabinet', max_length=45)

    class Meta:
        managed = False
        db_table = 'kabinet'
        ordering = ['id_kabinet']
        verbose_name='Кабинет'
        verbose_name_plural='Кабинеты'

    def __str__(self):
        return self.kabinet


class Klass(models.Model):
    id_klass = models.AutoField(db_column='id_Klass', primary_key=True)
    nomer = models.CharField(verbose_name='Класс', db_column='Nomer', max_length=45)

    class Meta:
        managed = False
        db_table = 'klass'
        ordering = ['id_klass']
        verbose_name='Класс'
        verbose_name_plural='Классы'

    def __str__(self):
        return self.nomer


class Predmet(models.Model):
    id_predmet = models.AutoField(db_column='id_Predmet', primary_key=True)
    predmet = models.CharField(verbose_name='Предмет', db_column='Predmet', max_length=45)

    class Meta:
        managed = False
        db_table = 'predmet'
        ordering = ['predmet']
        verbose_name='Предмет'
        verbose_name_plural='Предметы'

    def __str__(self):
        return self.predmet


class Prepodavateli(models.Model):
    id_prepodavatelya = models.AutoField(db_column='id_Prepodavatelya', primary_key=True)
    fio = models.CharField(verbose_name='ФИО преподавателя', db_column='FIO', max_length=60)
    predmet_1 = models.ForeignKey(Predmet, verbose_name='Предмет', on_delete=models.CASCADE, db_column='Predmet_1', related_name='Predmet_1')
    predmet_2 = models.ForeignKey(Predmet, verbose_name='Предмет', on_delete=models.CASCADE, blank=True, null=True, db_column='Predmet_2', related_name='Predmet_2')
    predmet_3 = models.ForeignKey(Predmet, verbose_name='Предмет', on_delete=models.CASCADE, blank=True, null=True, db_column='Predmet_3', related_name='Predmet_3')

    class Meta:
        managed = False
        db_table = 'prepodavateli'
        ordering = ['fio']
        verbose_name='Преподаватель'
        verbose_name_plural='Преподаватели'

    def __str__(self):
        return self.fio



class Uroki(models.Model):
    id_uroka = models.AutoField(db_column='id_Uroka', primary_key=True)
    nom_uroka = models.IntegerField(verbose_name='Номер урока', db_column='Nom_Uroka')

    class Meta:
        managed = False
        db_table = 'uroki'
        ordering = ['nom_uroka']
        verbose_name='Урок'
        verbose_name_plural='Уроки'

    def __str__(self):
        return str(self.nom_uroka)


class Raspisanie(models.Model):
    id_raspisanie = models.AutoField(db_column='id_Raspisanie', primary_key=True)
    day_nedeli = models.ForeignKey(DenbNedeli, verbose_name='День недели', on_delete=models.CASCADE, db_column='Day_Nedeli')
    urok = models.ForeignKey(Uroki, verbose_name='Номер урока', on_delete=models.CASCADE, db_column='Urok')
    klass = models.ForeignKey(Klass, verbose_name='Класс', on_delete=models.CASCADE, db_column='Klass')
    r_predmet = models.ForeignKey(Predmet, verbose_name='Предмет', on_delete=models.CASCADE, db_column='R_Predmet')
    kabinet = models.ForeignKey(Kabinet, verbose_name='Номер кабинета', on_delete=models.CASCADE, db_column='Kabinet')
    prepodavatel = models.ForeignKey(Prepodavateli, verbose_name='Преподаватель', on_delete=models.CASCADE, db_column='Prepodavatel')

    class Meta:
        managed = False
        db_table = 'raspisanie'
        ordering = ['day_nedeli', 'urok']
        verbose_name='Расписание'
        verbose_name_plural='Расписание'

    def __str__(self):
        return str(self.day_nedeli) + ' / Урок ' + str(self.urok) + ' - ' + str(self.klass)


