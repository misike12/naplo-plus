## Doesn't include any paid features, only things required for running the project

If you don't know what project I'm talking about, look [here](https://github.com/refilc/naplo)

# This submodule was last tested on 2024 February 21

## Instructions

After cloning `refilc/naplo`, change the remote url of the submodule
```sh
git submodule set-url filcnaplo_premium https://github.com/pml68/naplo-plus
```

Force the submodule to resynchronize with the modified file
```sh
git submodule sync
```

And clone it
```sh
git submodule update --init --recursive --remote
```
