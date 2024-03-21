# identify randomised participants in England

english_sites <- ORION_4_sites%>%
  filter(!is.na('NHS Trust Code'))%>% # filter those with a valid trust code (only applies to England)
  select('LCC ID')%>%
  .[[1]]

participant_status%>%
  filter(!is.na(date_randomized))%>% # select those randomised
  left_join(participants_centres, by="participant_id")%>% # join centre allocation
  filter(centre_id %in% english_sites)%>% # filter for english sites
  select(participant_id, date_randomized)-> participants_en

nrow(participants_en)
