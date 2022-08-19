[1mdiff --git a/app/assets/stylesheets/components/_footer.scss b/app/assets/stylesheets/components/_footer.scss[m
[1mindex ea59452..0b26b21 100644[m
[1m--- a/app/assets/stylesheets/components/_footer.scss[m
[1m+++ b/app/assets/stylesheets/components/_footer.scss[m
[36m@@ -3,14 +3,14 @@[m
   justify-content: space-around;[m
   position: fixed;[m
   bottom: 0;[m
[31m-  width: calc(100% - var(--scrollbar-gutter,0%));[m
[32m+[m[32m  background: linear-gradient(90deg, rgba(14,20,35,1) 0%, rgba(7,51,81,1) 50%, rgba(39,42,53,1) 67%);[m
 }[m
 .footer-links {[m
   display: flex;[m
   justify-content: center;[m
   align-items: center;[m
   border: 1px solid lightgrey;[m
[31m-  background: #AABBC3;[m
[32m+[m[32m  background: linear-gradient(90deg, rgba(14,20,35,1) 0%, rgba(7,51,81,1) 50%, rgba(39,42,53,1) 67%);[m
 }[m
 .footer-links a {[m
   color: white;[m
[1mdiff --git a/app/assets/stylesheets/pages/_home.scss b/app/assets/stylesheets/pages/_home.scss[m
[1mindex a7a1699..d52850f 100755[m
[1m--- a/app/assets/stylesheets/pages/_home.scss[m
[1m+++ b/app/assets/stylesheets/pages/_home.scss[m
[36m@@ -1,11 +1,12 @@[m
 // Specific CSS for your home-page[m
 body {[m
[31m- padding-top: 50px;[m
[31m- background: rgb(170,186,195);[m
[31m- background: linear-gradient(0deg, rgba(170,186,195,1) 0%, rgba(100,44,24,1) 50%, rgba(11,6,4,1) 67%);[m
[32m+[m[32m padding-top: 48px;[m
[32m+[m[32m//  background: rgb(170,186,195);[m
[32m+[m[32m  background: linear-gradient(90deg, rgba(14,20,35,1) 0%, rgba(7,51,81,1) 50%, rgba(39,42,53,1) 67%);[m
[32m+[m
 }[m
 [m
 .index-page {[m
[31m-  background: rgb(170,186,195);[m
[31m-  background: linear-gradient(0deg, rgba(170,186,195,1) 0%, rgba(100,44,24,1) 50%, rgba(11,6,4,1) 67%);[m
[32m+[m[32m  // background: rgb(170,186,195);[m
[32m+[m[32m  background: linear-gradient(90deg, rgba(14,20,35,1) 0%, rgba(7,51,81,1) 50%, rgba(39,42,53,1) 67%);[m
 }[m
