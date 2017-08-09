FROM openjdk:8-jdk

RUN apt-get --quiet update --yes
RUN apt-get --quiet install --yes wget tar unzip lib32stdc++6 lib32z1
RUN wget --quiet --output-document=android-sdk.zip https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip
RUN unzip -qq android-sdk.zip
RUN echo y | tools/bin/sdkmanager "platforms;android-26"
RUN echo y | tools/bin/sdkmanager "platform-tools"
RUN echo y | tools/bin/sdkmanager "build-tools;26.0.0"
RUN echo y | tools/bin/sdkmanager "extras;android;m2repository"
RUN echo y | tools/bin/sdkmanager "extras;google;m2repository"
RUN export ANDROID_HOME=$PWD
RUN PATH=$PATH:$PWD/platform-tools/
