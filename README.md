# THP EventBrite

- Conception d'une application Rails de gestion d'évènements à la EventBrite.
- Création d'une base de données SQL avec plusieurs Model : User, Event et Attendance.
- Mise en place des tests unitaires Rspec
- Mailer qui notifie le utilisateur de la création de son compte
- Mailer qui notifie l'administrateur d'un event pour chaque nouveau participant.

## Pour faire fonctionner l'application

- `bundle install`
- `rails db:create`
- `rails db:migration`
- `rails db:seed`
- Une fois le seed terminé, ouvrir le fichier `config/development.rb` et modifier la ligne 63 `config.action_mailer.perform_deliveries = false` en `config.action_mailer.perform_deliveries = true` pour permettre l'envoi de mail
- `rails console` > créer un nouvel utilisateur
ex. `user = User.create(email:"supercool@yopmail.com", description:"Une super description du tonnerre izi.", first_name:"Supaire", last_name:"Chaise")`
- Go sur : http://www.yopmail.com (supercool@yopmail.com)
- Toujours dans la console > `attendance = Attendance.create(stripe_customer_id:1032350, event_id:1, user_id:3)`
- Vérifier que l'email à bien été envoyé à l'admin sur : http://www.yopmail.com (shynn@yopmail.com)

### Et voilà ヽ༼ຈل͜ຈ༽ﾉ

