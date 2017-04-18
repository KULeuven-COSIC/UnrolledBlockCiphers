# Single-Cycle Implementations of Block Ciphers

Security mechanisms to protect our systems and data from malicious adversaries have become essential. Strong encryption algorithms are an important building block of these solutions. However, each application has its own requirements and it is not always possible to find a cipher that meets them all. This work compares unrolled combinational hardware implementations of six lightweight block ciphers, along with an AES implementation as a baseline. Up until now, the majority of such ciphers were designed for area-constrained environments where speed is often not crucial, but recently the need for single-cycle, low-latency block ciphers with limited area requirements has arisen to build security architectures for embedded systems. Our comparison shows that some designers are already on this track, but a lot of work still remains to be done.

## Ciphers

This repository has fully unrolled implementations of the following ciphers in VHDL:

| Cipher  | Block Size | Key Size |
|---------|------------|----------|
| AES     | 128        | 128      |
| KATAN   | 32         | 80       |
| KATAN   | 64         | 80       |
| PRESENT | 64         | 80       |
| PRINCE  | 64         | 128      |
| SIMON   | 32         | 64       |
| SIMON   | 64         | 128      |
| SPECK   | 32         | 64       |
| SPECK   | 64         | 128      |

## Further Reading

These ciphers were analyzed and compared in the paper "Single-Cycle Implementations of Block Ciphers", available at https://eprint.iacr.org/2015/658.pdf.

## Acknowledgements

This work was supported in part by the Research Council KU Leuven: GOA TENSE (GOA/11/007). In addition, this work is supported in part by the Flemish Government through FWO G.0130.13N and FWO G.0876.14N. We would like to thank Kimmo Järvinen for his valued advice. Pieter Maene is supported by a doctoral grant of the Research Foundation - Flanders (FWO).
