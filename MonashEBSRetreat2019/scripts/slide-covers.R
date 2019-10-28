# this script is to get the cover photos from my talks
library(tidyverse)
library(glue)

dat <- tribble(
  ~talk, ~url, ~images,
  "../20181201_AASC/emi-tanaka-presentation.html", NA, "talk1.png",
  "../20190612_choosemaths/slides.html", "https://bit.ly/choosemaths2019", "talk2.png",
  "../20190626_EcoSta2019/slides.html", "https://bit.ly/ecosta2019", "talk3.png",
  "../20190704_SSABioConsult/slides.html", NA, "talk4.png",
  "../20190724_RSSDSS/slides.html", "https://bit.ly/tanaka-rssds2019", "talk5.png",
  "../20190818_ISIWSC2019/slides.html", "https://bit.ly/tanaka-isiwsc2019", "talk6.png",
  "../20190906_SIA/slides.html", 'https://bit.ly/tanaka-sia2019', "talk7.png",
  "../20190916_ANU_Business_School/index.html", "https://emitanaka.org/slides/ANU2019", "talk8.png",
  "../20191015_Macquarie/index.html", "https://emitanaka.org/slides/MQ2019", "talk9.png",
)

# this does not work
# webshot::webshot(dat$talk[2], file = "talk1.png")
# let's just resort to manual screenshot as it's not too many

dat %>% 
  mutate(url = ifelse(is.na(url),
                      "http://emitanaka.org/slides/MonashEBSRetreat2019/notavailable.html",
                      url)) %>% 
  glue_data("::: item
            <a href='{url}'><img align='middle' class='slide' src='images/{images}' width='80%'></a>
            :::")


