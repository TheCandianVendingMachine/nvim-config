return {
    settings = {
        pyright = {
            disableOrganizeImports = true,
        },
        python = {
            analysis = {
                ignore = { '*' },
                typeCheckingMode = 'standard',
                diagnosticMode = 'workspace'
            },
        }
    }
}

