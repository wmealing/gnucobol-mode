[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">

  <h3 align="center">GnuCOBOL mode</h3>

  <p align="center">
    GnuCOBOL mode for your Emacs.
    <a href="https://github.com/wmealing/gnucobol-mode/wiki/">View Demo</a>
    ·
    <a href="https://github.com/wmealing/gnucobol-mode/issues">Report Bug</a>
    ·
    <a href="https://github.com/wmealing/gnucobol-mode/issues">Request Feature</a>
  </p>
</div>



<!-- ABOUT THE PROJECT -->
## About The Project

This is not the official cobol-mode for emacs.  It is something that I am working on to make working in GnuCOBOL for emacs a little nicer for anyone
involved.  If your'e an emacs and cobol programmer, I'd love some other contributors or maybe if you want to take over and take the reins thats good too!

This projects should allow : syntax highlighting, non-strange indentation, 'compile-mode' and more !.

This is "readme" driven development, if something is marked UNIMPLEMENTED, it is not yet finished. 


### Built With

- <a href="https://gnucobol.sourceforge.io/">GnuCOBOL</a>
- <a href="https://www.gnu.org/software/emacs/">Emacs</a>

<!-- GETTING STARTED -->
## Getting Started

This is an example of how you may give instructions on setting up your project locally.
To get a local copy up and running follow these simple example steps.

### Prerequisites

- The system will need gnucobol, git and emacs installed.  Exactly how this is acheived depends on your operating system and distribution.

  ```sh
  git clone https://github.com/wmealing/gnucobol-mode.git 
  ```

### Installation

Listed below is an example on how to install gnucobol-mode on a Linux:


2. Clone the repo
   ```sh
   cd ~/.emacs.d/
   git clone https://github.com/wmealing/gnucobol-mode.git
   ```
3. Add the git repository path to your emacs init file: 
   ```lisp
   (add-to-list 'load-path (expand-file-name "~/.emacs.d/gnucobol-mode"))
   ```
4. Setup emacs to load gnucobol for files ending in .cbl or cpy files.
   ```lisp
	(setq auto-mode-alist
      	(append
       		'(("\\.cob\\'" . gnucobol-mode)
         	 ("\\.cbl\\'"  . gnucobol-mode)
          	 ("\\.cpy\\'"  . gnucobol-mode)) auto-mode-alist))

   ```


<!-- USAGE EXAMPLES -->
## Usage

Load or create a new file in emacs ending in cbl or cob, such as test.cob and a number of
new features will become available.

1) UNIMPLEMENTED: yasnippets mode

2) UNIMPLEMENTED Program skeletons

3) UNIMPLEMENTED keyword completion

4) UNIMPLEMENTED indentation rules. 


<!-- ROADMAP -->
## Roadmap

- [ ] Highlighting
  - [ ] Highlight reserved words.
  - [ ] Mnemonics words.
  - [ ] system words.

- [ ] Indenting
    - [ ] Free mode 
    - [ ] Traditional cobol

- [ ] Cobol ruler zones ?
- [ ] Flymake support
- [ ] Skeletons
- [ ] Your suggestion here.

See the [open issues](https://github.com/wmealing/gnucobol-mode/issues) for a full list of proposed features (and known issues).



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".

Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<!-- LICENSE -->
## License

Distributed under the GPL License. See `LICENSE` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Your Name - [@your_twitter](https://twitter.com/wmealing) -

Project Link: [https://github.com/wmealing/gnucobol-mode](https://github.com/wmealing/gnucobol-mode)

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Use this space to list resources you find helpful and would like to give credit to. I've included a few of my favorites to kick things off!

* [Choose an Open Source License](https://choosealicense.com)
* [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
* [React Icons](https://react-icons.github.io/react-icons/search)
