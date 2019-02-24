library("kableExtra")
df = read.csv("Gantt_chart_data_sample.csv",
              stringsAsFactors = FALSE)
kb = kable(df, "html")
kable_styling(kable_input = kb, 
              bootstrap_options = "striped",
              full_width = FALSE)
