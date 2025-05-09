# README

## Coding Exercise

## Testing:
* after setup of the db, events can be triggered in the rails console like `Job::Event::Activated(payload: {job_id: 123})`
* urls for jobs and applications are jobs/list and applications/list

## What's missing
* I didn't create any controllers to trigger events,
* There's no real error handling, the json allows to return errors to the user (see ..
* I did not consider race condition handling

## Comments
I enjoyed the exercise, I had not implemented Event Sourcing before, so had to spend some time to read.
I left comments a few places.
  
