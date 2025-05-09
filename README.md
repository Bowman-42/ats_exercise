# README

## Coding Exercise

I used sqlite to keep the initial setup easy. 

## Testing:
* after setup of the db, events can be triggered in the rails console like `Job::Event::Activated(payload: {job_id: 123})`
* urls for jobs and applications are jobs/list and applications/list

## What's missing
* I didn't create any controllers to trigger events,
* There's no real error handling, the json allows to return errors to the user, see https://github.com/Bowman-42/ats_exercise/blob/84ae0e49e999294d031d49564441f664a9ee92dd/app/controllers/applications_controller.rb#L25
* I did not consider race condition handling

## Comments
I enjoyed the exercise, I had not implemented Event Sourcing before, so had to spend some time to read.
I left comments a few places.
I considered using https://github.com/RailsEventStore/rails_event_store, didn't because that looked like overkill for this exercise and implementing it myself resulted in more learning
  
