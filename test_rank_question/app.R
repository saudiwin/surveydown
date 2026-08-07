library(surveydown)
library(shiny.i18n)

db <- sd_database(
  host   = "",
  dbname = "",
  port   = "",
  user   = "",
  table  = "",
  ignore = TRUE
)

i18n <- shiny.i18n::Translator$new(translation_json_path = "translations.json")
i18n$set_translation_language("en")

server <- function(input, output, session) {

  output$language_selector <- shiny::renderUI({
    shiny::selectInput(
      "selected_language",
      "Language / اللغة:",
      choices = c("English" = "en", "Arabic / عربي" = "ar"),
      selected = "en"
    )
  })

  translator <- reactive({
    lang <- input$selected_language
    if (!is.null(lang)) {
      i18n$set_translation_language(lang)
    }
    i18n
  })

  # Define matrix questions reactively using shiny.i18n, same pattern as saudi_swf
  # Labels are used as both names and values (names(labels) <- labels)

  observe({

    policy_labels <- translator()$t(c(
    "The government should increase spending on public transportation infrastructure",
    "Carbon taxes are an effective way to reduce greenhouse gas emissions",
    "Universal basic income would reduce poverty"
  ))
  names(policy_labels) <- policy_labels

  sd_question(
    type   = 'matrix',
    id     = 'policy_opinions',
    label  = translator()$t("How much do you agree with the following policy statements?"),
    row    = policy_labels,
    option = c(
      "Strongly Agree"    = "strongly_agree",
      "Agree"             = "agree",
      "Disagree"          = "disagree",
      "Strongly Disagree" = "strongly_disagree"
    )
  )

  # Unnamed row test (same as before, but also reactive)
  unnamed_labels <- c("q1", "q2", "q3")

  sd_question(
    type   = 'matrix',
    id     = 'policy_opinions_unnamed',
    label  = "Unnamed row vector test: How much do you agree?",
    row    = unnamed_labels,
    option = c(
      "Strongly Agree"    = "strongly_agree",
      "Agree"             = "agree",
      "Disagree"          = "disagree",
      "Strongly Disagree" = "strongly_disagree"
    )
  )


  })

  

  sd_skip_if()
  sd_show_if()

  sd_server(
    db = db
  )

}

shiny::shinyApp(ui = sd_ui(), server = server)
