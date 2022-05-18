<%!
    import config.project
    import user.personal
    import config.version
%>${config.project.name}
${'=' * len(config.project.name)}

version: ${config.version.str}

${config.project.description_short}

${config.project.long_description}

	${user.personal.personal_origin}, ${config.project.project_copyright_years_short}
