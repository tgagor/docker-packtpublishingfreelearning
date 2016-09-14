Ready to run container with code from: https://github.com/igbt6/Packt-Publishing-Free-Learning

# HOWTO

Run it periodically (every day to get daily free books) like this:

```
docker run --rm \
  -e PPFL_EMAIL=your@mail.com \
  -e PPFL_PASSWORD=YourPassword \
  -e PPFL_DOWNLOAD_FORMATS="pdf, epub, mobi, code" \
  -v /path/in/your/fs/books:/books \
  -ti tgagor/packtpublishingfreelearning
```

Just replace login, password with your credentials, choose your local path and formats you want (or omit this variable to stick with defaults) and run.

You might also run it like this to download your whole books collection:

```
docker run --rm \
  -e PPFL_EMAIL=your@mail.com \
  -e PPFL_PASSWORD=YourPassword \
  -e PPFL_DOWNLOAD_FORMATS="pdf, epub, mobi, code" \
  -v /path/in/your/fs/books:/books \
  -ti tgagor/packtpublishingfreelearning \
  python3 /opt/ppfl/packtPublishingFreeEbook.py -da
```
