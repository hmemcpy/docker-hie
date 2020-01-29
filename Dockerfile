FROM nixos/nix

# Configure and install GHC 8.6.5, Cachix, and HIE
RUN nix-env -iA cachix -f https://cachix.org/api/v1/install && cachix use all-hies \
    #
    # Install GHC 8.6.5
    && nix-env -i ghc-8.6.5 \
    #
    # Install HIE for GHC 8.6.5
    && nix-env -iA unstableFallback.selection --arg selector 'p: { inherit (p) ghc865; }' -f https://github.com/infinisil/all-hies/tarball/master