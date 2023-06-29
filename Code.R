library(metan)

df <- read.csv("data.csv")

mod <-
  gamem(df,
        gen = GEN,
        rep = REP,
        resp = everything())


gmd(mod, "blupg")


mgidi_ind <- mgidi(mod)

gmd(mgidi_ind, "MGIDI")

mgidi_ind2 <-
   mgidi(mod,
         weights = c(1, .2, .2, 1),
         SI = 30)

gmd(mgidi_ind2, "MGIDI")


# plot the contribution of each factor on the MGIDI index
p1 <- plot(mgidi_ind, type = "contribution")
p2 <- plot(mgidi_ind2, type = "contribution")
p1 + p2


mgidi_ind3 <-
  mgidi(mod,
       ideotype = c("h, h, h, l"))


#https://tiagoolivoto.github.io/metan/reference/mgidi.html
