# siraben's Nixpkgs overlay

> Here lies pearls, oddballs, hacks, historical curiosities, strange
> loops and more, collected over the years during my internet travels,
> packaged in Nix in the hopes that they too will spark curiosity,
> fascinate, educate and inspire future hackers.

Rather than leave them to bit-rot in my computer, I decided to
preserve them for the future by writing this overlay.  If they make
their way into Nixpkgs, I'll remove them from my overlay.

## Usage
With Nix flakes, run
```ShellSession
$ nix shell github:siraben/siraben-overlay#bootstrap-scheme -c scheme
Welcome to Bootstrap Scheme. Use ctrl-c to exit.
> (define (fact n) (if (= 0 n) 1 (* n (fact (- n 1)))))
ok
> (fact 20)
2432902008176640000
> Goodbye
```

## Disclaimer
Although I have audited the source for most packages, I do not take
responsibility from any consequence of using the build artifacts of
any package in this repository.

## License
This repository is licensed under the [GPLv3 License](LICENSE) or
later.  Note that this only applies to the files in this repository
but may not apply to the build outputs or original package sources.
