FFmpeg License

FFmpeg is licensed under the GNU Lesser General Public License (LGPL) version 2.1 or later. However, FFmpeg incorporates several optional modules that are covered by the GNU General Public License (GPL) version 2 or later, notably libpostproc and libswscale. If those parts get used the GPL applies to all of FFmpeg.

Read the license texts to learn how this affects programs built on top of FFmpeg or reusing FFmpeg. You may also wish to have a look at the GPL FAQ.

Here is a short list of things you need to take into consideration when you incorporate FFmpeg into proprietary programs. This list is not exhaustive, it just lists the most common issues we encounter.

    * Be careful if you enable GPL components.
    * Provide the license text, the correct version.
    * Provide FFmpeg sources, the exact version you use.
    * Review your EULA terms. They have to be compatible with the license of FFmpeg. For example, terms forbidding reverse engineering are not acceptable.
    * Read the LGPL license text, multiple times, and educate yourself about its effects.

Trademark

FFmpeg is a trademark of Fabrice Bellard, originator of the FFmpeg project.
Patent Mini-FAQ

A lot of legal questions surrounding patents arise when discussing multimedia technology. This mini-FAQ attempts to address these issues. Note that much of this discussion is based on precedent, or what has happened in the past under similar circumstances. Very little consideration is given to what could happen. If you use your imagination, you can visualize any dire scenario and cease doing any productive work.

Q: Does FFmpeg use patented algorithms?
A: We do not know, we are not lawyers so we are not qualified to answer this. Also we have never read patents to implement any part of FFmpeg, so even if we were qualified we could not answer it as we do not know what is patented. Furthermore the sheer number of software patents makes it impossible to read them all so no one (lawyer or not) could answer such a question with a definite no, those who do lie. What we do know is that various standards FFmpeg supports contain vague hints that any conforming implementation might be subject to some patent rights in some jurisdictions, examples for such statements are:
For H.264:

    ITU draws attention to the possibility that the practice or implementation of this Recommendation may involve the use of a claimed Intellectual Property Right. ITU takes no position concerning the evidence, validity or applicability of claimed Intellectual Property Rights, whether asserted by ITU members or others outside of the Recommendation development process.

And for MPEG-4:

    The user's attention is called to the possibility that, for some of the processes specified in this part of ISO/IEC 14496, conformance with this specification may require use of an invention covered by patent rights. By publication of this part of ISO/IEC 14496, no position is taken with respect to the validity of this claim or of any patent rights in connection therewith.

Q: Is it legal to use such patented algorithms?
A: Patent laws change wildly between jurisdictions. Besides, even in places where software patents are recognized, there is serious doubt about the legitimacy of such legislation. Note that patents on algorithms are illegal in many countries. Plus the use of patents to prevent the usage of a format or codec on a specific operating system or together with specific other software might violate antitrust laws.

Q: Bottom line: Should I be worried about patent issues if I use FFmpeg?
A: Are you a private user working with FFmpeg for your own personal purposes? If so, there is remarkably little reason to be concerned. Are you using FFmpeg in a commercial software product? Read on to the next question...

Q: Since FFmpeg is licensed under the LGPL, is it perfectly alright to incorporate the whole FFmpeg core into my own commercial product?
A: You might have a problem here. Sure, the LGPL allows you to incorporate the code. However, there have been cases where companies have used FFmpeg in their projects, usually for such capabilities as superior MPEG-4 decoding. These companies found out that once you start trying to make money from certain technologies, the alleged owners of the technologies will come after their protection money. Most notably, MPEG-LA (licensing authority) is vigilant and diligent about collecting for MPEG-related technologies.

Q: You called the patent license fee protection money, is this a joke?
A: No. The legal validity of these patents is highly questionable. Still in many current legal systems it is very easy to ruin a company with patents even if the patents are invalid. Paying the (small) license fee is much cheaper than a patent lawsuit during which you would not be able to sell your product as the patent would be valid until you win the lawsuit 5+ years in the future. That is assuming you did not go bankrupt in the meantime...

Q: Can I be safe if I have paid my protection money.
A: You can never be safe as long as your country recognizes software patents as valid. There are companies that own many patents, pay and cross-license for other companies patents, but even such companies are being found guilty of infringing some obscure little-known patent and end up paying millions for it. That's why lobbying against software patents is in your own interest. Of course none of this is related to you using FFmpeg or another codec implementation. If you want to be safe the only option is not to touch any software at all. 