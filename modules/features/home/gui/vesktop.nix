{ ... }:
{
  flake.modules.homeManager.gui =
    { ... }:
    {
      programs.vesktop = {
        enable = true;

        settings = {
          splashColor = "rgb(205, 214, 244)";
          splashBackground = "rgb(17, 17, 27)";
          spellCheckLanguages = [
            "pl"
            "pl-PL"
            "en"
          ];
          tray = true;
        };

        vencord.settings = {
          autoUpdate = true;
          autoUpdateNotification = true;
          useQuickCss = true;
          eagerPatches = false;
          enableReactDevtools = false;
          frameless = true;
          transparent = false;
          winCtrlQ = false;
          disableMinSize = false;
          winNativeTitleBar = false;
          plugins = {
            BadgeAPI = {
              enabled = true;
            };
            CommandsAPI = {
              enabled = true;
            };
            ContextMenuAPI = {
              enabled = true;
            };
            MemberListDecoratorsAPI = {
              enabled = true;
            };
            MessageAccessoriesAPI = {
              enabled = true;
            };
            MessageDecorationsAPI = {
              enabled = true;
            };
            MessageEventsAPI = {
              enabled = true;
            };
            MessagePopoverAPI = {
              enabled = true;
            };
            NoticesAPI = {
              enabled = true;
            };
            ServerListAPI = {
              enabled = true;
            };
            SettingsStoreAPI = {
              enabled = true;
            };
            NoTrack = {
              enabled = true;
              disableAnalytics = true;
            };
            Settings = {
              enabled = true;
              settingsLocation = "aboveActivity";
              includeVencordInfoWhenCopying = true;
            };
            AlwaysAnimate = {
              enabled = true;
            };
            AlwaysTrust = {
              enabled = true;
              domain = true;
              file = true;
            };
            AnonymiseFileNames = {
              enabled = true;
              method = 0;
              randomisedLength = 7;
              anonymiseByDefault = true;
            };
            BANger = {
              enabled = false;
            };
            BetterFolders = {
              enabled = false;
              sidebar = true;
              showFolderIcon = 1;
              keepIcons = false;
              closeAllHomeButton = false;
              closeAllFolders = false;
              forceOpen = false;
              closeOthers = false;
              sidebarAnim = true;
            };
            BetterGifAltText = {
              enabled = false;
            };
            BetterNotesBox = {
              enabled = false;
            };
            BetterRoleDot = {
              enabled = false;
            };
            BetterUploadButton = {
              enabled = true;
            };
            BiggerStreamPreview = {
              enabled = false;
            };
            BlurNSFW = {
              enabled = true;
              blurAmount = 10;
            };
            CallTimer = {
              enabled = true;
              format = "stopwatch";
            };
            ClearURLs = {
              enabled = true;
            };
            ColorSighted = {
              enabled = false;
            };
            ConsoleShortcuts = {
              enabled = true;
            };
            CrashHandler = {
              enabled = true;
              attemptToPreventCrashes = true;
              attemptToNavigateToHome = false;
            };
            CustomRPC = {
              enabled = false;
            };
            Experiments = {
              enabled = false;
              enableIsStaff = false;
              forceStagingBanner = false;
            };
            F8Break = {
              enabled = false;
            };
            FakeNitro = {
              enabled = true;
              enableEmojiBypass = true;
              enableStickerBypass = true;
              enableStreamQualityBypass = true;
              transformStickers = true;
              transformEmojis = true;
              transformCompoundSentence = false;
              emojiSize = 48;
              stickerSize = 160;
              hyperLinkText = "{{NAME}}";
              useHyperLinks = true;
              disableEmbedPermissionCheck = false;
            };
            FakeProfileThemes = {
              enabled = true;
              nitroFirst = true;
            };
            FavoriteEmojiFirst = {
              enabled = true;
            };
            FixInbox = {
              enabled = false;
            };
            ForceOwnerCrown = {
              enabled = false;
            };
            FriendInvites = {
              enabled = true;
            };
            GameActivityToggle = {
              enabled = false;
            };
            GifPaste = {
              enabled = false;
            };
            iLoveSpam = {
              enabled = true;
            };
            IgnoreActivities = {
              enabled = false;
            };
            ImageZoom = {
              enabled = true;
              size = 391.02564102564105;
              zoom = 2.4972671135907087;
              nearestNeighbour = false;
              square = true;
              saveZoomValues = true;
              invertScroll = true;
              zoomSpeed = 0.5;
              preventCarouselFromClosingOnClick = true;
            };
            KeepCurrentChannel = {
              enabled = false;
            };
            LastFMRichPresence = {
              enabled = false;
            };
            LoadingQuotes = {
              enabled = true;
              replaceEvents = true;
              enableDiscordPresetQuotes = false;
              additionalQuotes = "";
              additionalQuotesDelimiter = "|";
              enablePluginPresetQuotes = true;
            };
            MemberCount = {
              enabled = true;
              memberList = true;
              toolTip = true;
              voiceActivity = true;
            };
            MessageClickActions = {
              enabled = false;
            };
            MessageLinkEmbeds = {
              enabled = false;
            };
            MessageLogger = {
              enabled = true;
              deleteStyle = "overlay";
              ignoreBots = false;
              ignoreSelf = false;
              ignoreUsers = "";
              ignoreChannels = "";
              ignoreGuilds = "";
              logEdits = true;
              logDeletes = true;
              collapseDeleted = false;
              inlineEdits = true;
            };
            MoreCommands = {
              enabled = false;
            };
            MoreKaomoji = {
              enabled = false;
            };
            MoreUserTags = {
              enabled = true;
              tagSettings = {
                WEBHOOK = {
                  text = "Webhook";
                  showInChat = true;
                  showInNotChat = true;
                };
                OWNER = {
                  text = "Owner";
                  showInChat = true;
                  showInNotChat = true;
                };
                ADMINISTRATOR = {
                  text = "Admin";
                  showInChat = true;
                  showInNotChat = true;
                };
                MODERATOR_STAFF = {
                  text = "Staff";
                  showInChat = true;
                  showInNotChat = true;
                };
                MODERATOR = {
                  text = "Mod";
                  showInChat = true;
                  showInNotChat = true;
                };
                VOICE_MODERATOR = {
                  text = "VC Mod";
                  showInChat = true;
                  showInNotChat = true;
                };
                CHAT_MODERATOR = {
                  text = "Chat Mod";
                  showInChat = true;
                  showInNotChat = true;
                };
              };
            };
            Moyai = {
              enabled = false;
            };
            MutualGroupDMs = {
              enabled = true;
            };
            NoBlockedMessages = {
              enabled = true;
              ignoreMessages = false;
              applyToIgnoredUsers = true;
            };
            NoDevtoolsWarning = {
              enabled = false;
            };
            NoF1 = {
              enabled = true;
            };
            NoPendingCount = {
              enabled = false;
              hideFriendRequestsCount = true;
              hideMessageRequestsCount = true;
              hidePremiumOffersCount = true;
            };
            NoProfileThemes = {
              enabled = false;
            };
            NoRPC = {
              enabled = false;
            };
            NoReplyMention = {
              enabled = false;
            };
            NoScreensharePreview = {
              enabled = false;
            };
            NoSystemBadge = {
              enabled = false;
            };
            NoUnblockToJump = {
              enabled = true;
            };
            NSFWGateBypass = {
              enabled = true;
            };
            oneko = {
              enabled = false;
            };
            OpenInApp = {
              enabled = true;
              spotify = true;
              steam = true;
              epic = true;
              tidal = true;
              itunes = true;
            };
            PermissionsViewer = {
              enabled = true;
              permissionsSortOrder = 0;
              defaultPermissionsDropdownState = false;
            };
            petpet = {
              enabled = false;
            };
            PinDMs = {
              enabled = true;
              pinOrder = 0;
              canCollapseDmSection = false;
              dmSectionCollapsed = true;
            };
            PlainFolderIcon = {
              enabled = true;
            };
            PlatformIndicators = {
              enabled = false;
              colorMobileIndicator = true;
              list = true;
              badges = true;
              messages = true;
            };
            QuickMention = {
              enabled = false;
            };
            QuickReply = {
              enabled = false;
            };
            ReactErrorDecoder = {
              enabled = false;
            };
            ReadAllNotificationsButton = {
              enabled = false;
            };
            RelationshipNotifier = {
              enabled = true;
              offlineRemovals = true;
              groups = true;
              servers = true;
              friends = true;
              friendRequestCancels = true;
              notices = true;
            };
            RevealAllSpoilers = {
              enabled = false;
            };
            ReverseImageSearch = {
              enabled = true;
            };
            RoleColorEverywhere = {
              enabled = true;
              chatMentions = true;
              memberList = true;
              voiceUsers = true;
              reactorsList = true;
              colorChatMessages = false;
              pollResults = true;
            };
            SendTimestamps = {
              enabled = true;
              replaceMessageContents = true;
            };
            ServerListIndicators = {
              enabled = false;
              mode = 2;
            };
            ShikiCodeblocks = {
              enabled = true;
              useDevIcon = "GREYSCALE";
              theme = "https://cdn.jsdelivr.net/gh/shikijs/textmate-grammars-themes@bc5436518111d87ea58eb56d97b3f9bec30e6b83/packages/tm-themes/themes/catppuccin-mocha.json";
              tryHljs = "SECONDARY";
              bgOpacity = 100;
            };
            ShowAllMessageButtons = {
              enabled = false;
            };
            ShowConnections = {
              enabled = true;
              iconSpacing = 1;
              iconSize = 32;
            };
            ShowHiddenChannels = {
              enabled = true;
              showMode = 0;
              hideUnreads = true;
              defaultAllowedUsersAndRolesDropdownState = true;
            };
            ShowMeYourName = {
              enabled = false;
              mode = "user";
              friendNicknames = "always";
              displayNames = true;
              inReplies = true;
            };
            SilentMessageToggle = {
              enabled = true;
              persistState = false;
              autoDisable = true;
            };
            SilentTyping = {
              enabled = true;
              showIcon = true;
              isEnabled = true;
              contextMenu = true;
            };
            SortFriendRequests = {
              enabled = true;
              showDates = false;
            };
            SpotifyControls = {
              enabled = false;
            };
            SpotifyCrack = {
              enabled = true;
              noSpotifyAutoPause = true;
              keepSpotifyActivityOnIdle = false;
            };
            SpotifyShareCommands = {
              enabled = false;
            };
            StartupTimings = {
              enabled = false;
            };
            SupportHelper = {
              enabled = true;
            };
            TextReplace = {
              enabled = false;
            };
            TimeBarAllActivities = {
              enabled = false;
            };
            Translate = {
              enabled = true;
              autoTranslate = false;
              receivedInput = "auto";
              receivedOutput = "pl";
              sentInput = "auto";
              sentOutput = "el";
              showChatBarButton = true;
              service = "google";
              showAutoTranslateTooltip = true;
              showAutoTranslateAlert = false;
            };
            TypingIndicator = {
              enabled = true;
              includeMutedChannels = false;
              includeCurrentChannel = true;
              indicatorMode = 3;
              includeBlockedUsers = false;
            };
            TypingTweaks = {
              enabled = true;
              alternativeFormatting = true;
              showRoleColors = true;
              showAvatars = true;
            };
            Unindent = {
              enabled = false;
            };
            UnsuppressEmbeds = {
              enabled = false;
            };
            UrbanDictionary = {
              enabled = false;
            };
            UserVoiceShow = {
              enabled = false;
            };
            USRBG = {
              enabled = true;
              voiceBackground = true;
              nitroFirst = true;
            };
            UwUifier = {
              enabled = false;
            };
            ValidUser = {
              enabled = true;
            };
            VoiceChatDoubleClick = {
              enabled = true;
            };
            VcNarrator = {
              enabled = false;
            };
            VencordToolbox = {
              enabled = false;
            };
            ViewIcons = {
              enabled = false;
              format = "webp";
              imgSize = "1024";
            };
            ViewRaw = {
              enabled = true;
              clickMethod = "Left";
              messageContextMenu = false;
            };
            VolumeBooster = {
              enabled = false;
            };
            GreetStickerPicker = {
              enabled = true;
            };
            WhoReacted = {
              enabled = true;
            };
            Wikisearch = {
              enabled = false;
            };
            "WebRichPresence (arRPC)" = {
              enabled = false;
            };
            WebContextMenus = {
              enabled = false;
              addBack = true;
            };
            FavoriteGifSearch = {
              enabled = false;
            };
            VoiceMessages = {
              enabled = true;
            };
            SecretRingToneEnabler = {
              enabled = false;
            };
            NormalizeMessageLinks = {
              enabled = false;
            };
            PreviewMessage = {
              enabled = false;
            };
            CopyUserURLs = {
              enabled = true;
            };
            FixSpotifyEmbeds = {
              enabled = true;
            };
            "AI Noise Suppression" = {
              enabled = true;
            };
            ThemeAttributes = {
              enabled = false;
            };
            PictureInPicture = {
              enabled = true;
            };
            Dearrow = {
              enabled = true;
              hideButton = false;
              replaceElements = 0;
              dearrowByDefault = true;
            };
            OnePingPerDM = {
              enabled = true;
              channelToAffect = "both_dms";
              allowMentions = false;
              allowEveryone = false;
            };
            PermissionFreeWill = {
              enabled = false;
            };
            NoMosaic = {
              enabled = false;
            };
            NoTypingAnimation = {
              enabled = false;
            };
            SuperReactionTweaks = {
              enabled = false;
            };
            ClientTheme = {
              enabled = false;
              color = "ffffff";
            };
            Decor = {
              enabled = false;
            };
            FixImagesQuality = {
              enabled = true;
            };
            NotificationVolume = {
              enabled = false;
            };
            XSOverlay = {
              enabled = false;
            };
            BetterGifPicker = {
              enabled = true;
            };
            FixCodeblockGap = {
              enabled = true;
            };
            FixYoutubeEmbeds = {
              enabled = true;
            };
            ChatInputButtonAPI = {
              enabled = true;
            };
            DisableCallIdle = {
              enabled = false;
            };
            NewGuildSettings = {
              enabled = true;
              guild = true;
              everyone = true;
              role = true;
              showAllChannels = true;
              events = true;
              highlights = true;
              messages = 3;
            };
            WebKeybinds = {
              enabled = true;
            };
            BetterRoleContext = {
              enabled = false;
            };
            ResurrectHome = {
              enabled = false;
            };
            FriendsSince = {
              enabled = true;
            };
            BetterSettings = {
              enabled = true;
              disableFade = true;
              eagerLoad = true;
              organizeMenu = true;
            };
            OverrideForumDefaults = {
              enabled = false;
            };
            PartyMode = {
              enabled = false;
            };
            ServerInfo = {
              enabled = true;
            };
            ShowHiddenThings = {
              enabled = true;
              showTimeouts = true;
              showInvitesPaused = true;
              showModView = true;
              disableDiscoveryFilters = true;
              disableDisallowedDiscoveryFilters = true;
            };
            MessageUpdaterAPI = {
              enabled = true;
            };
            UserSettingsAPI = {
              enabled = true;
            };
            AppleMusicRichPresence = {
              enabled = false;
            };
            AutomodContext = {
              enabled = false;
            };
            BetterSessions = {
              enabled = true;
              backgroundCheck = false;
            };
            ConsoleJanitor = {
              enabled = false;
            };
            CopyEmojiMarkdown = {
              enabled = false;
            };
            CtrlEnterSend = {
              enabled = false;
            };
            CustomIdle = {
              enabled = false;
              idleTimeout = 10;
              remainInIdle = true;
            };
            disableCallIdle = {
              enabled = true;
            };
            DontRoundMyTimestamps = {
              enabled = false;
            };
            ImageLink = {
              enabled = true;
            };
            ImplicitRelationships = {
              enabled = true;
              sortByAffinity = true;
            };
            MaskedLinkPaste = {
              enabled = false;
            };
            MentionAvatars = {
              enabled = true;
              showAtSymbol = true;
            };
            MessageLatency = {
              enabled = false;
            };
            NoDefaultHangStatus = {
              enabled = false;
            };
            NoOnboardingDelay = {
              enabled = true;
            };
            NoServerEmojis = {
              enabled = false;
            };
            PauseInvitesForever = {
              enabled = false;
            };
            ReplaceGoogleSearch = {
              enabled = true;
              replacementEngine = "off";
            };
            ReplyTimestamp = {
              enabled = false;
            };
            Summaries = {
              enabled = false;
            };
            ShowTimeoutDuration = {
              enabled = true;
              displayStyle = "ssalggnikool";
            };
            StreamerModeOnStream = {
              enabled = false;
            };
            UnlockedAvatarZoom = {
              enabled = true;
              zoomMultiplier = 4;
            };
            ValidReply = {
              enabled = true;
            };
            VoiceDownload = {
              enabled = true;
            };
            WebScreenShareFixes = {
              enabled = true;
              experimentalAV1Support = false;
            };
            YoutubeAdblock = {
              enabled = true;
            };
            NoMaskedUrlPaste = {
              enabled = false;
            };
            AlwaysExpandRoles = {
              enabled = false;
            };
            CopyFileContents = {
              enabled = false;
            };
            StickerPaste = {
              enabled = false;
            };
            FullSearchContext = {
              enabled = true;
            };
            AccountPanelServerProfile = {
              enabled = false;
            };
            UserMessagesPronouns = {
              enabled = false;
              showInMessages = true;
              showSelf = true;
              pronounSource = 0;
              showInProfile = true;
            };
            DynamicImageModalAPI = {
              enabled = true;
            };
            FullUserInChatbox = {
              enabled = false;
            };
            IrcColors = {
              enabled = false;
            };
            HideMedia = {
              enabled = false;
            };
            DisableDeepLinks = {
              enabled = true;
            };
            ExpressionCloner = {
              enabled = true;
            };
            CopyStickerLinks = {
              enabled = false;
            };
            ImageFilename = {
              enabled = false;
            };
            MoreQuickReactions = {
              enabled = true;
              reactionCount = 5;
            };
            CustomCommands = {
              enabled = true;
              tagsList = { };
            };
            CharacterCounter = {
              enabled = true;
            };
            NoMiddleClickPaste = {
              enabled = false;
            };
            ConcatenatedComponentExtractor = {
              enabled = true;
            };
          };
          uiElements = {
            chatBarButtons = { };
            messagePopoverButtons = { };
          };
          notifications = {
            timeout = 5000;
            position = "bottom-right";
            useNative = "not-focused";
            logLimit = 50;
          };
          cloud = {
            authenticated = true;
            url = "https://api.vencord.dev/";
            settingsSync = true;
            settingsSyncVersion = 1780525926666;
          };
          notifyAboutUpdates = false;
          macosTranslucency = false;
          windowsMaterial = "none";
        };
      };
    };
}
