get_messages <- function() {
    # Initialize messages list from '_survey/settings.yml' file
    result <- get_messages_yml()

    if (is.null(result)) {
        # '_survey/settings.yml' file missing, so just load English
        messages <- get_messages_default()
        language <- 'en'
        return(list(
            messages = messages[["en"]],
            language = language
        ))
    }

    return(list(
        messages = result$messages,
        language = result$language
    ))
}

get_messages_yml <- function() {
    # Read messages from settings.yml
    path <- file.path("_survey", "settings.yml")
    if (fs::file_exists(path)) {
        tryCatch(
            {
                full_settings <- yaml::read_yaml(path)

                # Look for system-messages key (kebab-case only)
                if (!is.null(full_settings$`system-messages`)) {
                    # Get the system-language from survey-settings (kebab-case)
                    language <- full_settings$`survey-settings`$`system-language`
                    if (is.null(language)) {
                        language <- "en" # Default to English if not specified
                    }

                    return(list(
                        messages = full_settings$`system-messages`,
                        language = language
                    ))
                }
            },
            error = function(e) {
                return(NULL)
            }
        )
    }
    return(NULL)
}

get_messages_default <- function() {
    return(list(
        "en" = list(
            #server.R
            "cancel" = "Cancel",
            "confirm-exit" = "Confirm Exit",
            "sure-exit" = "Are you sure you want to exit the survey?",
            "submit-exit" = "Submit and Exit",
            "warning" = "Warning",
            "required" = "Please answer all required questions before proceeding.",
            "rating-title" = "Before you go...",
            "rating-text" = "Rate your survey experience:",
            "rating-scale" = "from 1-poor to 5-excellent",
            # ui.R
            "previous" = "Previous",
            "next" = "Next",
            "exit" = "Exit Survey",
            "restart" = "Restart Survey",
            "close-tab" = "Please close this tab manually to exit the survey.",
            "choose-option" = "Choose an option...",
            "click" = "Click here",
            "redirect" = "Redirecting in",
            "seconds" = "seconds",
            "new-tab" = "Opens in a new tab",
            "redirect-error" = "Error: This text won't trigger any redirection..."
        ),
        "de" = list(
            #server.R
            "cancel" = "Abbrechen",
            "confirm-exit" = "Beenden best\u00e4tigen",
            "sure-exit" = "Sind Sie sicher, dass Sie die Umfrage beenden m\u00f6chten?",
            "submit-exit" = "Absenden und beenden",
            "warning" = "Warnung",
            "required" = "Bitte beantworten Sie alle erforderlichen Fragen, bevor Sie fortfahren.",
            "rating-title" = "Bevor Sie gehen...",
            "rating-text" = "Bewerten Sie Ihre Umfrageerfahrung:",
            "rating-scale" = "von 1-schlecht bis 5-ausgezeichnet",
            # ui.R
            "previous" = "Zur\u00fcck",
            "next" = "Weiter",
            "exit" = "Umfrage beenden",
            "restart" = "Umfrage neu starten",
            "close-tab" = "Bitte schlie\u00dfen Sie diesen Tab manuell, um die Umfrage zu beenden.",
            "choose-option" = "Option ausw\u00e4hlen...",
            "click" = "Hier klicken",
            "redirect" = "Weiterleitung in",
            "seconds" = "Sekunden",
            "new-tab" = "\u00d6ffnet sich in einem neuen Tab",
            "redirect-error" = "Fehler: Dieser Text wird keine Weiterleitung ausl\u00f6sen..."
        ),
        "es" = list(
            #server.R
            "cancel" = "Cancelar",
            "confirm-exit" = "Confirmar Salida",
            "sure-exit" = "\u00bfEst\u00e1 seguro de que desea salir de la encuesta?",
            "submit-exit" = "Enviar y Salir",
            "warning" = "Advertencia",
            "required" = "Por favor, responda todas las preguntas obligatorias antes de continuar.",
            "rating-title" = "Antes de irse...",
            "rating-text" = "Califique su experiencia en la encuesta:",
            "rating-scale" = "de 1-malo a 5-excelente",
            # ui.R
            "previous" = "Anterior",
            "next" = "Siguiente",
            "exit" = "Salir de la Encuesta",
            "restart" = "Reiniciar Encuesta",
            "close-tab" = "Por favor, cierre esta pesta\u00f1a manualmente para salir de la encuesta.",
            "choose-option" = "Elija una opci\u00f3n...",
            "click" = "Haga clic aqu\u00ed",
            "redirect" = "Redireccionando en",
            "seconds" = "segundos",
            "new-tab" = "Se abre en una nueva pesta\u00f1a",
            "redirect-error" = "Error: Este texto no activar\u00e1 ninguna redirecci\u00f3n..."
        ),
        "fr" = list(
            #server.R
            "cancel" = "Annuler",
            "confirm-exit" = "Confirmer la sortie",
            "sure-exit" = "\u00cates-vous s\u00fbr de vouloir quitter le sondage?",
            "submit-exit" = "Soumettre et quitter",
            "warning" = "Avertissement",
            "required" = "Veuillez r\u00e9pondre \u00e0 toutes les questions obligatoires avant de continuer.",
            "rating-title" = "Avant de partir...",
            "rating-text" = "\u00c9valuez votre exp\u00e9rience du sondage :",
            "rating-scale" = "de 1-mauvais \u00e0 5-excellent",
            # ui.R
            "previous" = "Pr\u00e9c\u00e9dent",
            "next" = "Suivant",
            "exit" = "Quitter le sondage",
            "restart" = "Red\u00e9marrer le sondage",
            "close-tab" = "Veuillez fermer cet onglet manuellement pour quitter le sondage.",
            "choose-option" = "Choisissez une option...",
            "click" = "Cliquez ici",
            "redirect" = "Redirection dans",
            "seconds" = "secondes",
            "new-tab" = "S'ouvre dans un nouvel onglet",
            "redirect-error" = "Erreur : Ce texte n'activera aucune redirection..."
        ),
        "it" = list(
            #server.R
            "cancel" = "Annulla",
            "confirm-exit" = "Conferma Uscita",
            "sure-exit" = "Sei sicuro di voler uscire dal sondaggio?",
            "submit-exit" = "Invia ed Esci",
            "warning" = "Avviso",
            "required" = "Per favore, rispondi a tutte le domande obbligatorie prima di procedere.",
            "rating-title" = "Prima di andare...",
            "rating-text" = "Valuta la tua esperienza con il sondaggio:",
            "rating-scale" = "da 1-scarso a 5-eccellente",
            # ui.R
            "previous" = "Indietro",
            "next" = "Avanti",
            "exit" = "Esci dal Sondaggio",
            "restart" = "Riavvia Sondaggio",
            "close-tab" = "Per favore, chiudi questa scheda manualmente per uscire dal sondaggio.",
            "choose-option" = "Scegli un'opzione...",
            "click" = "Clicca qui",
            "redirect" = "Reindirizzamento in",
            "seconds" = "secondi",
            "new-tab" = "Si apre in una nuova scheda",
            "redirect-error" = "Errore: Questo testo non attiver\u00e0 alcun reindirizzamento..."
        ),
        "zh-CN" = list(
            #server.R
            "cancel" = "\u53d6\u6d88", # \u53d6\u6d88
            "confirm-exit" = "\u786e\u8ba4\u9000\u51fa", # \u786e\u8ba4\u9000\u51fa
            "sure-exit" = "\u60a8\u786e\u8ba4\u8981\u9000\u51fa\u5417\uff1f", # \u60a8\u786e\u8ba4\u8981\u9000\u51fa\u5417\uff1f
            "submit-exit" = "\u63d0\u4ea4\u5e76\u9000\u51fa", # \u63d0\u4ea4\u5e76\u9000\u51fa
            "warning" = "\u8b66\u544a", # \u8b66\u544a
            "required" = "\u8bf7\u56de\u7b54\u6240\u6709\u5fc5\u586b\u95ee\u9898\u3002", # \u8bf7\u56de\u7b54\u6240\u6709\u5fc5\u586b\u95ee\u9898\u3002
            "rating-title" = "\u7a0d\u7b49\u4e00\u4e0b\u2026", # \u7a0d\u7b49\u4e00\u4e0b\u2026
            "rating-text" = "\u8bf7\u60a8\u4e3a\u6b64\u6b21\u95ee\u5377\u6253\u5206\uff1a", # \u8bf7\u60a8\u4e3a\u6b64\u6b21\u95ee\u5377\u6253\u5206\uff1a
            "rating-scale" = "1\u4e3a\u975e\u5e38\u4e0d\u6ee1\u610f\uff0c5\u4e3a\u975e\u5e38\u6ee1\u610f", # 1\u4e3a\u975e\u5e38\u4e0d\u6ee1\u610f\uff0c5\u4e3a\u975e\u5e38\u6ee1\u610f
            # ui.R
            "previous" = "\u4e0a\u4e00\u9875", # \u4e0a\u4e00\u9875
            "next" = "\u4e0b\u4e00\u9875", # \u4e0b\u4e00\u9875
            "exit" = "\u9000\u51fa\u95ee\u5377", # \u9000\u51fa\u95ee\u5377
            "restart" = "\u91cd\u65b0\u5f00\u59cb\u95ee\u5377", # \u91cd\u65b0\u5f00\u59cb\u95ee\u5377
            "close-tab" = "\u8bf7\u624b\u52a8\u5173\u95ed\u672c\u9875\u9762\u3002", # \u8bf7\u624b\u52a8\u5173\u95ed\u672c\u9875\u9762\u3002
            "choose-option" = "\u8bf7\u9009\u62e9\u4e00\u9879\u2026", # \u8bf7\u9009\u62e9\u4e00\u9879\u2026
            "click" = "\u5355\u51fb\u6b64\u5904", # \u5355\u51fb\u6b64\u5904
            "redirect" = "\u8df3\u8f6c\u5012\u8ba1\u65f6", # \u8df3\u8f6c\u5012\u8ba1\u65f6
            "seconds" = "\u79d2", # \u79d2
            "new-tab" = "\u5728\u65b0\u9875\u9762\u5f00\u542f", # \u5728\u65b0\u9875\u9762\u5f00\u542f
            "redirect-error" = "\u9519\u8bef\uff1a\u6b64\u6587\u672c\u65e0\u6cd5\u89e6\u53d1\u4efb\u4f55\u8df3\u8f6c\u2026" # \u9519\u8bef\uff1a\u6b64\u6587\u672c\u65e0\u6cd5\u89e6\u53d1\u4efb\u4f55\u8df3\u8f6c\u2026
        ),
        "ar" = list(
            #server.R
            "cancel" = "\u0625\u0644\u063a\u0627\u0621",
            "confirm-exit" = "\u062a\u0623\u0643\u064a\u062f \u0627\u0644\u062e\u0631\u0648\u062c",
            "sure-exit" = "\u0647\u0644 \u0623\u0646\u062a \u0645\u062a\u0623\u0643\u062f \u0623\u0646\u0643 \u062a\u0631\u064a\u062f \u0627\u0644\u062e\u0631\u0648\u062c \u0645\u0646 \u0627\u0644\u0627\u0633\u062a\u0628\u064a\u0627\u0646\u061f",
            "submit-exit" = "\u0625\u0631\u0633\u0627\u0644 \u0648\u0627\u0644\u062e\u0631\u0648\u062c",
            "warning" = "\u062a\u062d\u0630\u064a\u0631",
            "required" = "\u064a\u0631\u062c\u0649 \u0627\u0644\u0625\u062c\u0627\u0628\u0629 \u0639\u0644\u0649 \u062c\u0645\u064a\u0639 \u0627\u0644\u0623\u0633\u0626\u0644\u0629 \u0627\u0644\u0645\u0637\u0644\u0648\u0628\u0629 \u0642\u0628\u0644 \u0627\u0644\u0645\u062a\u0627\u0628\u0639\u0629.",
            "rating-title" = "\u0642\u0628\u0644 \u0627\u0644\u0645\u063a\u0627\u062f\u0631\u0629...",
            "rating-text" = "\u0642\u064a\u0651\u0645 \u062a\u062c\u0631\u0628\u062a\u0643 \u0641\u064a \u0627\u0644\u0627\u0633\u062a\u0628\u064a\u0627\u0646:",
            "rating-scale" = "\u0645\u0646 1-\u0636\u0639\u064a\u0641 \u0625\u0644\u0649 5-\u0645\u0645\u062a\u0627\u0632",
            # ui.R
            "previous" = "\u0627\u0644\u0633\u0627\u0628\u0642",
            "next" = "\u0627\u0644\u062a\u0627\u0644\u064a",
            "exit" = "\u0627\u0644\u062e\u0631\u0648\u062c \u0645\u0646 \u0627\u0644\u0627\u0633\u062a\u0628\u064a\u0627\u0646",
            "restart" = "\u0625\u0639\u0627\u062f\u0629 \u062a\u0634\u063a\u064a\u0644 \u0627\u0644\u0627\u0633\u062a\u0628\u064a\u0627\u0646",
            "close-tab" = "\u064a\u0631\u062c\u0649 \u0625\u063a\u0644\u0627\u0642 \u0647\u0630\u0627 \u0627\u0644\u062a\u0628\u0648\u064a\u0628 \u064a\u062f\u0648\u064a\u064b\u0627 \u0644\u0644\u062e\u0631\u0648\u062c \u0645\u0646 \u0627\u0644\u0627\u0633\u062a\u0628\u064a\u0627\u0646.",
            "choose-option" = "\u0627\u062e\u062a\u0631 \u062e\u064a\u0627\u0631\u064b\u0627...",
            "click" = "\u0627\u0646\u0642\u0631 \u0647\u0646\u0627",
            "redirect" = "\u0625\u0639\u0627\u062f\u0629 \u0627\u0644\u062a\u0648\u062c\u064a\u0647 \u062e\u0644\u0627\u0644",
            "seconds" = "\u062b\u0648\u0627\u0646\u0650",
            "new-tab" = "\u064a\u0641\u062a\u062d \u0641\u064a \u062a\u0628\u0648\u064a\u0628 \u062c\u062f\u064a\u062f",
            "redirect-error" = "\u062e\u0637\u0623: \u0647\u0630\u0627 \u0627\u0644\u0646\u0635 \u0644\u0646 \u064a\u064f\u0641\u0639\u0651\u0644 \u0623\u064a \u0625\u0639\u0627\u062f\u0629 \u062a\u0648\u062c\u064a\u0647..."
        )
    ))
}

get_valid_languages <- function() {
    return(c(
        "ar",
        "az",
        "bg",
        "bs",
        "ca",
        "cs",
        "cy",
        "da",
        "de",
        "el",
        "en",
        "en-AU",
        "en-GB",
        "eo",
        "es",
        "et",
        "eu",
        "fa",
        "fi",
        "fo",
        "fr-CH",
        "fr",
        "gl",
        "he",
        "hr",
        "hu",
        "hy",
        "id",
        "is",
        "it-CH",
        "it",
        "ja",
        "ka",
        "kh",
        "kk",
        "ko",
        "kr",
        "lt",
        "lv",
        "me",
        "mk",
        "mn",
        "ms",
        "nb",
        "nl-BE",
        "nl",
        "no",
        "pl",
        "pt-BR",
        "pt",
        "ro",
        "rs-latin",
        "rs",
        "ru",
        "sk",
        "sl",
        "sq",
        "sr-latin",
        "sr",
        "sv",
        "sw",
        "th",
        "tr",
        "uk",
        "vi",
        "zh-CN",
        "zh-TW"
    ))
}
