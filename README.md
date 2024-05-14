```
ตัวอย่างการใช้งาน
STEP1 section1, 3
ADD paragraph section1 nat: <p>cat1</p>
ADD paragraph section3 benz: <p>cat3</p>
git checkout nat/section1 && git commit -a -m "nat/section1 add paragraph cat1 cat3" && git push
GO Pull Request: nat/section1 -> (merge) -> main
---
STEP2 section4
git checkout vick/section4

git checkout main && git fetch && git pull && git checkout vick/section4 && git rebase main
```

# html-css-git-mini-project

อ่านรายละเอียดของ Mini project ได้จากที่ [Notion](https://www.notion.so/techup/HTML-CSS-Git-Mini-Project-4029c70d8bb24fb48868e2a6deb275a9)
