name: Lazy Kernel Builder

on:
  push:

jobs:
  super-job:
      runs-on: ubuntu-20.04
      steps:
      - uses: actions/checkout@v2
      - name: Setup
        run: |
          sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
          sudo apt-get update
          sudo apt-get install -y flex bison ncurses-dev texinfo gcc gperf patch libtool automake g++ libncurses5-dev gawk subversion expat libexpat1-dev python-all-dev binutils-dev bc libcap-dev autoconf libgmp-dev build-essential pkg-config libmpc-dev libmpfr-dev autopoint gettext txt2man liblzma-dev libssl-dev libz-dev mercurial wget tar gcc-10 g++-10 cmake zstd ninja-build lz4 liblz4-tool liblz4-dev lzma --fix-broken --fix-missing
      - name: Set build date
        id: get-date
        run: |
          sudo timedatectl set-timezone Asia/Jakarta
          echo ::set-output name=date::$(/bin/date -u "+%Y%m%d")
      - name: Build & Push
        run: |
          git config --global user.name "BAGas1230"
          git config --global user.email "auradanish626@gmail.com"
          source env.sh
          echo "Cloning kernel"
          git clone --depth=1 $KERNEL_REPO -b $KERNEL_BRANCH kernel && cd kernel
          mv /home/runner/work/lazy-kernel-build/lazy-kernel-build/build.sh /home/runner/work/lazy-kernel-build/lazy-kernel-build/kernel
          source build.sh
        env:
            GITHUB_EMAIL: auradanish626@gmail.com
            GITHUB_TOKEN: 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
            GITHUB_USER: BAGas1230
            TG_CHAT_ID: -1001258259919
            TG_TOKEN: 1956393048:AAF0V0m7bUqfdo9I7zmxhrPt_o1-JIsmjd4
      - uses: yanzay/notify-telegram@v0.1.0
        if: always()
        with:
          chat: Jembutkriting # user id or channel name secret
          token: 1956393048:AAF0V0m7bUqfdo9I7zmxhrPt_o1-JIsmjd4 # token secret
          status: ${{ job.status }} # do not modify this line
