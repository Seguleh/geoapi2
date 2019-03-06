# README

Simple API to handle JSON format requests

Made to provide fast record insertion.

The JSON format expected as collection of coordiantes:

[
  {'latitude': float, 'longitude': float},
  {'latitude': float, 'lon...},
  {...},
  ...
]

Future implementation to include user_id identification as such:

[
  {'user_id': integer, 'latitude': float, 'longitude': float},
  {'user_id': integer, 'latitude': float, 'lon...},
  {...},
  ...
]

*HStore of coordinates collection sounds better, as to eliminate the need for 'user_id' and just use the record id to identify the user but this would limit the amount of coordinates that can be stored per user.
