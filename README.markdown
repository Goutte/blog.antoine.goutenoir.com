


## Todo

- [ ] Convert Pages (12/35)
- [ ] Google Analytics
- [ ] GitHub repo

## Documentation

Use `bundle exec rake ...` instead of just `rake ...` to dodge ruby versions problems.
Added system `"mv #{public_dir}/blog/archives #{public_dir}/archives"` to some tasks in the rakefile,
because jekyll seems to be dumb about the archives path.

/!\ therefore, rake watch is "broken"