# README

 ### Change the spec file "spec/system/users_spec.rb" line 111
 
from
```
it '画像編集フォームが表示される' do
  expect(page).to have_field 'user[profile_image]'
end
```
to
```
it '画像編集フォームが表示される' do
  expect(page).to have_field 'user[image]'
end
```
because of mistaking to make the column name

---

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
