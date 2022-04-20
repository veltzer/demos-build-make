project_name="demos-make"
project_long_description="Demos for GNU make"
project_year_started="2010"
project_description="TBD"

import datetime
project_year_now=str(datetime.datetime.now().year)
project_copyright_years=", ".join(
    map(str, range(int(project_year_started), int(project_year_now)+1)))
project_copyright_years_short = f"{project_year_started} - {project_year_now}"
