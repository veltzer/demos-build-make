'''
project definitions for templar
'''

def populate(d):
    d.project_name='demos-make'
    d.project_long_description='Demos for GNU make'
    d.project_year_started='2010'
    d.project_description='TBD'

def getdeps():
    return [
        __file__, # myself
    ]
