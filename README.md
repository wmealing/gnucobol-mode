[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]

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

  The authors configuration is Fedora 36, GnuCOBOL 3.1.2.0, Emcas 28.2.  Other versions may work, but this is what is tested.

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
  - [ ] System words.

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

Your Name - [@wademealing](https://twitter.com/wmealing) -

Project Link: [https://github.com/wmealing/gnucobol-mode](https://github.com/wmealing/gnucobol-mode)

## FAQ 

Q: Are you going to put this on melpa  ?

A: Not at this time, I'm not sure how commited I am to Cobol as I'm pretty easily distracted.

Q: Does this work with my works cobol implementation ?

A: I dont work with your implementation, I dont know.  I dont know how the other implementations work because it doesnt run on my machine.
   When that happens, and It doesn't cost me money, then I'll think about it.

Q: Can you support X ?

A: I don't have infinite free time, you can always make a feature request, or do it yourself.  




<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/wmealing/gnucobol-mode.svg?style=for-the-badge
[contributors-url]: https://github.com/wmealing/gnucobol-mode/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/wmealing/gnucobol-mode.svg?style=for-the-badge
[forks-url]: https://github.com/wmealing/gnucobol-mode/network/members
[stars-shield]: https://img.shields.io/github/stars/wmealing/gnucobol-mode.svg?style=for-the-badge
[stars-url]: https://github.com/wmealing/gnucobol-mode/stargazers
[issues-shield]: https://img.shields.io/github/issues/wmealing/gnucobol-mode.svg?style=for-the-badge
[issues-url]: https://github.com/wmealing/gnucobol-mode/issues
[license-shield]: https://img.shields.io/github/license/wmealing/gnucobol-mode.svg?style=for-the-badge
[license-url]: https://github.com/wmealing/gnucobol-mode/blob/master/LICENSE.txt
