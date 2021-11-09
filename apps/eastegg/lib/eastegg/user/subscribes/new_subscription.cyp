CREATE (:User {id: $user})-[:SUBSCRIBED_TO {since: $since}]->(:Channel {id: $channel})
