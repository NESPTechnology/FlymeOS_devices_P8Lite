.class public final Lcom/android/server/om/OverlayManagerService;
.super Lcom/android/server/SystemService;
.source "OverlayManagerService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/server/om/OverlayManagerService$1;,
        Lcom/android/server/om/OverlayManagerService$OverlayChangeListener;,
        Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;,
        Lcom/android/server/om/OverlayManagerService$PackageReceiver;,
        Lcom/android/server/om/OverlayManagerService$UserReceiver;
    }
.end annotation


# static fields
.field static final DEBUG:Z = false

.field static final PERMISSION_MODIFY_OVERLAYS:Ljava/lang/String; = "oms.permission.MODIFY_OVERLAYS"

.field static final TAG:Ljava/lang/String; = "OverlayManager"


# instance fields
.field private mContext:Landroid/content/Context;

.field private final mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

.field private final mLock:Ljava/lang/Object;

.field private final mPackageManager:Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;

.field private final mPersistSettingsScheduled:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final mService:Landroid/os/IBinder;

.field private final mSettings:Lcom/android/server/om/OverlayManagerSettings;

.field private final mSettingsFile:Landroid/util/AtomicFile;

.field private final mUserManager:Lcom/android/server/pm/UserManagerService;


# direct methods
.method static synthetic -get0(Lcom/android/server/om/OverlayManagerService;)Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic -get1(Lcom/android/server/om/OverlayManagerService;)Lcom/android/server/om/OverlayManagerServiceImpl;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

    return-object v0
.end method

.method static synthetic -get2(Lcom/android/server/om/OverlayManagerService;)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic -get3(Lcom/android/server/om/OverlayManagerService;)Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mPackageManager:Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;

    return-object v0
.end method

.method static synthetic -get4(Lcom/android/server/om/OverlayManagerService;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mPersistSettingsScheduled:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object v0
.end method

.method static synthetic -get5(Lcom/android/server/om/OverlayManagerService;)Lcom/android/server/om/OverlayManagerSettings;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mSettings:Lcom/android/server/om/OverlayManagerSettings;

    return-object v0
.end method

.method static synthetic -get6(Lcom/android/server/om/OverlayManagerService;)Landroid/util/AtomicFile;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mSettingsFile:Landroid/util/AtomicFile;

    return-object v0
.end method

.method static synthetic -get7(Lcom/android/server/om/OverlayManagerService;)Lcom/android/server/pm/UserManagerService;
    .locals 1

    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mUserManager:Lcom/android/server/pm/UserManagerService;

    return-object v0
.end method

.method static synthetic -wrap0(Lcom/android/server/om/OverlayManagerService;Landroid/content/pm/PackageInfo;)Z
    .locals 1
    .param p1, "pi"    # Landroid/content/pm/PackageInfo;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/om/OverlayManagerService;->isOverlayPackage(Landroid/content/pm/PackageInfo;)Z

    move-result v0

    return v0
.end method

.method static synthetic -wrap1(Lcom/android/server/om/OverlayManagerService;)V
    .locals 0

    invoke-direct {p0}, Lcom/android/server/om/OverlayManagerService;->schedulePersistSettings()V

    return-void
.end method

.method static synthetic -wrap2(Lcom/android/server/om/OverlayManagerService;ILjava/lang/String;)V
    .locals 0
    .param p1, "userId"    # I
    .param p2, "targetPackageName"    # Ljava/lang/String;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/om/OverlayManagerService;->updateAssets(ILjava/lang/String;)V

    return-void
.end method

.method static synthetic -wrap3(Lcom/android/server/om/OverlayManagerService;ILjava/util/List;)V
    .locals 0
    .param p1, "userId"    # I
    .param p2, "targetPackageNames"    # Ljava/util/List;

    .prologue
    invoke-direct {p0, p1, p2}, Lcom/android/server/om/OverlayManagerService;->updateSelectedAssets(ILjava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/server/pm/Installer;)V
    .locals 13
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "installer"    # Lcom/android/server/pm/Installer;

    .prologue
    const/4 v12, 0x0

    const/4 v4, 0x0

    .line 221
    invoke-direct {p0, p1}, Lcom/android/server/SystemService;-><init>(Landroid/content/Context;)V

    .line 203
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mLock:Ljava/lang/Object;

    .line 215
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v12}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mPersistSettingsScheduled:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 424
    new-instance v0, Lcom/android/server/om/OverlayManagerService$1;

    invoke-direct {v0, p0}, Lcom/android/server/om/OverlayManagerService$1;-><init>(Lcom/android/server/om/OverlayManagerService;)V

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mService:Landroid/os/IBinder;

    .line 222
    iput-object p1, p0, Lcom/android/server/om/OverlayManagerService;->mContext:Landroid/content/Context;

    .line 224
    new-instance v0, Landroid/util/AtomicFile;

    new-instance v1, Ljava/io/File;

    invoke-static {}, Landroid/os/Environment;->getDataSystemDirectory()Ljava/io/File;

    move-result-object v2

    const-string/jumbo v5, "overlays.xml"

    invoke-direct {v1, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Landroid/util/AtomicFile;-><init>(Ljava/io/File;)V

    .line 223
    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mSettingsFile:Landroid/util/AtomicFile;

    .line 225
    new-instance v0, Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;

    invoke-direct {v0}, Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;-><init>()V

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mPackageManager:Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;

    .line 226
    invoke-static {}, Lcom/android/server/pm/UserManagerService;->getInstance()Lcom/android/server/pm/UserManagerService;

    move-result-object v0

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mUserManager:Lcom/android/server/pm/UserManagerService;

    .line 227
    new-instance v11, Lcom/android/server/om/IdmapManager;

    invoke-direct {v11, p2}, Lcom/android/server/om/IdmapManager;-><init>(Lcom/android/server/pm/Installer;)V

    .line 228
    .local v11, "im":Lcom/android/server/om/IdmapManager;
    new-instance v0, Lcom/android/server/om/OverlayManagerSettings;

    invoke-direct {v0}, Lcom/android/server/om/OverlayManagerSettings;-><init>()V

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mSettings:Lcom/android/server/om/OverlayManagerSettings;

    .line 229
    new-instance v0, Lcom/android/server/om/OverlayManagerServiceImpl;

    iget-object v1, p0, Lcom/android/server/om/OverlayManagerService;->mPackageManager:Lcom/android/server/om/OverlayManagerService$PackageManagerHelper;

    iget-object v2, p0, Lcom/android/server/om/OverlayManagerService;->mSettings:Lcom/android/server/om/OverlayManagerSettings;

    invoke-direct {v0, v1, v11, v2}, Lcom/android/server/om/OverlayManagerServiceImpl;-><init>(Lcom/android/server/om/OverlayManagerServiceImpl$PackageManagerHelper;Lcom/android/server/om/IdmapManager;Lcom/android/server/om/OverlayManagerSettings;)V

    iput-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

    .line 231
    new-instance v3, Landroid/content/IntentFilter;

    invoke-direct {v3}, Landroid/content/IntentFilter;-><init>()V

    .line 232
    .local v3, "packageFilter":Landroid/content/IntentFilter;
    const-string/jumbo v0, "android.intent.action.PACKAGE_ADDED"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 233
    const-string/jumbo v0, "android.intent.action.PACKAGE_CHANGED"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 234
    const-string/jumbo v0, "android.intent.action.PACKAGE_REMOVED"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 235
    const-string/jumbo v0, "package"

    invoke-virtual {v3, v0}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 236
    invoke-virtual {p0}, Lcom/android/server/om/OverlayManagerService;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lcom/android/server/om/OverlayManagerService$PackageReceiver;

    invoke-direct {v1, p0, v4}, Lcom/android/server/om/OverlayManagerService$PackageReceiver;-><init>(Lcom/android/server/om/OverlayManagerService;Lcom/android/server/om/OverlayManagerService$PackageReceiver;)V

    sget-object v2, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object v5, v4

    invoke-virtual/range {v0 .. v5}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 239
    new-instance v8, Landroid/content/IntentFilter;

    invoke-direct {v8}, Landroid/content/IntentFilter;-><init>()V

    .line 240
    .local v8, "userFilter":Landroid/content/IntentFilter;
    const-string/jumbo v0, "android.intent.action.USER_REMOVED"

    invoke-virtual {v8, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 241
    invoke-virtual {p0}, Lcom/android/server/om/OverlayManagerService;->getContext()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Lcom/android/server/om/OverlayManagerService$UserReceiver;

    invoke-direct {v6, p0, v4}, Lcom/android/server/om/OverlayManagerService$UserReceiver;-><init>(Lcom/android/server/om/OverlayManagerService;Lcom/android/server/om/OverlayManagerService$UserReceiver;)V

    sget-object v7, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object v9, v4

    move-object v10, v4

    invoke-virtual/range {v5 .. v10}, Landroid/content/Context;->registerReceiverAsUser(Landroid/content/BroadcastReceiver;Landroid/os/UserHandle;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 244
    invoke-direct {p0}, Lcom/android/server/om/OverlayManagerService;->restoreSettings()V

    .line 245
    invoke-virtual {p0, v12}, Lcom/android/server/om/OverlayManagerService;->onSwitchUser(I)V

    .line 246
    invoke-direct {p0}, Lcom/android/server/om/OverlayManagerService;->schedulePersistSettings()V

    .line 248
    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mSettings:Lcom/android/server/om/OverlayManagerSettings;

    new-instance v1, Lcom/android/server/om/OverlayManagerService$OverlayChangeListener;

    invoke-direct {v1, p0, v4}, Lcom/android/server/om/OverlayManagerService$OverlayChangeListener;-><init>(Lcom/android/server/om/OverlayManagerService;Lcom/android/server/om/OverlayManagerService$OverlayChangeListener;)V

    invoke-virtual {v0, v1}, Lcom/android/server/om/OverlayManagerSettings;->addChangeListener(Lcom/android/server/om/OverlayManagerSettings$ChangeListener;)V

    .line 250
    const-string/jumbo v0, "overlay"

    iget-object v1, p0, Lcom/android/server/om/OverlayManagerService;->mService:Landroid/os/IBinder;

    invoke-virtual {p0, v0, v1}, Lcom/android/server/om/OverlayManagerService;->publishBinderService(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 251
    const-class v0, Lcom/android/server/om/OverlayManagerService;

    invoke-virtual {p0, v0, p0}, Lcom/android/server/om/OverlayManagerService;->publishLocalService(Ljava/lang/Class;Ljava/lang/Object;)V

    .line 220
    return-void
.end method

.method private getDeadUsers()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/UserInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 784
    iget-object v6, p0, Lcom/android/server/om/OverlayManagerService;->mUserManager:Lcom/android/server/pm/UserManagerService;

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Lcom/android/server/pm/UserManagerService;->getUsers(Z)Ljava/util/List;

    move-result-object v5

    .line 785
    .local v5, "users":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    iget-object v6, p0, Lcom/android/server/om/OverlayManagerService;->mUserManager:Lcom/android/server/pm/UserManagerService;

    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Lcom/android/server/pm/UserManagerService;->getUsers(Z)Ljava/util/List;

    move-result-object v3

    .line 789
    .local v3, "onlyLiveUsers":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/UserInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 790
    .local v0, "iter":Ljava/util/Iterator;, "Ljava/util/Iterator<Landroid/content/pm/UserInfo;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 791
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/UserInfo;

    .line 792
    .local v4, "ui":Landroid/content/pm/UserInfo;
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "live$iterator":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/pm/UserInfo;

    .line 793
    .local v1, "live":Landroid/content/pm/UserInfo;
    iget v6, v4, Landroid/content/pm/UserInfo;->id:I

    iget v7, v1, Landroid/content/pm/UserInfo;->id:I

    if-ne v6, v7, :cond_1

    .line 794
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 800
    .end local v1    # "live":Landroid/content/pm/UserInfo;
    .end local v2    # "live$iterator":Ljava/util/Iterator;
    .end local v4    # "ui":Landroid/content/pm/UserInfo;
    :cond_2
    return-object v5
.end method

.method private isOverlayPackage(Landroid/content/pm/PackageInfo;)Z
    .locals 2
    .param p1, "pi"    # Landroid/content/pm/PackageInfo;

    .prologue
    const/4 v0, 0x0

    .line 619
    if-eqz p1, :cond_0

    iget-object v1, p1, Landroid/content/pm/PackageInfo;->overlayTarget:Ljava/lang/String;

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method private restoreSettings()V
    .locals 10

    .prologue
    const/4 v6, 0x0

    .line 762
    iget-object v8, p0, Lcom/android/server/om/OverlayManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v8

    .line 763
    :try_start_0
    iget-object v5, p0, Lcom/android/server/om/OverlayManagerService;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v5}, Landroid/util/AtomicFile;->getBaseFile()Ljava/io/File;

    move-result-object v5

    invoke-virtual {v5}, Ljava/io/File;->exists()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v5

    if-nez v5, :cond_0

    monitor-exit v8

    .line 764
    return-void

    .line 766
    :cond_0
    const/4 v3, 0x0

    .local v3, "stream":Ljava/io/FileInputStream;
    :try_start_1
    iget-object v5, p0, Lcom/android/server/om/OverlayManagerService;->mSettingsFile:Landroid/util/AtomicFile;

    invoke-virtual {v5}, Landroid/util/AtomicFile;->openRead()Ljava/io/FileInputStream;

    move-result-object v3

    .line 767
    .local v3, "stream":Ljava/io/FileInputStream;
    iget-object v5, p0, Lcom/android/server/om/OverlayManagerService;->mSettings:Lcom/android/server/om/OverlayManagerSettings;

    invoke-virtual {v5, v3}, Lcom/android/server/om/OverlayManagerSettings;->restore(Ljava/io/InputStream;)V

    .line 773
    invoke-direct {p0}, Lcom/android/server/om/OverlayManagerService;->getDeadUsers()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "deadUser$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/UserInfo;

    .line 774
    .local v0, "deadUser":Landroid/content/pm/UserInfo;
    invoke-virtual {v0}, Landroid/content/pm/UserInfo;->getUserHandle()Landroid/os/UserHandle;

    move-result-object v5

    invoke-virtual {v5}, Landroid/os/UserHandle;->getIdentifier()I

    move-result v4

    .line 775
    .local v4, "userId":I
    iget-object v5, p0, Lcom/android/server/om/OverlayManagerService;->mSettings:Lcom/android/server/om/OverlayManagerSettings;

    invoke-virtual {v5, v4}, Lcom/android/server/om/OverlayManagerSettings;->removeUser(I)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    goto :goto_0

    .line 779
    .end local v0    # "deadUser":Landroid/content/pm/UserInfo;
    .end local v1    # "deadUser$iterator":Ljava/util/Iterator;
    .end local v3    # "stream":Ljava/io/FileInputStream;
    .end local v4    # "userId":I
    :catch_0
    move-exception v5

    :try_start_2
    throw v5
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :catchall_0
    move-exception v6

    move-object v9, v6

    move-object v6, v5

    move-object v5, v9

    :goto_1
    if-eqz v3, :cond_1

    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_1
    :goto_2
    if-eqz v6, :cond_6

    :try_start_4
    throw v6
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 777
    :catch_1
    move-exception v2

    .line 778
    .local v2, "e":Ljava/lang/Exception;
    :try_start_5
    const-string/jumbo v5, "OverlayManager"

    const-string/jumbo v6, "failed to restore overlay state"

    invoke-static {v5, v6, v2}, Landroid/util/Slog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .end local v2    # "e":Ljava/lang/Exception;
    :cond_2
    monitor-exit v8

    .line 761
    return-void

    .line 779
    .restart local v1    # "deadUser$iterator":Ljava/util/Iterator;
    .restart local v3    # "stream":Ljava/io/FileInputStream;
    :cond_3
    if-eqz v3, :cond_4

    :try_start_6
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :cond_4
    :goto_3
    if-eqz v6, :cond_2

    :try_start_7
    throw v6
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 762
    .end local v1    # "deadUser$iterator":Ljava/util/Iterator;
    .end local v3    # "stream":Ljava/io/FileInputStream;
    :catchall_1
    move-exception v5

    monitor-exit v8

    throw v5

    .line 779
    .restart local v1    # "deadUser$iterator":Ljava/util/Iterator;
    .restart local v3    # "stream":Ljava/io/FileInputStream;
    :catch_2
    move-exception v6

    goto :goto_3

    .end local v1    # "deadUser$iterator":Ljava/util/Iterator;
    .end local v3    # "stream":Ljava/io/FileInputStream;
    :catch_3
    move-exception v7

    if-nez v6, :cond_5

    move-object v6, v7

    goto :goto_2

    :cond_5
    if-eq v6, v7, :cond_1

    :try_start_8
    invoke-virtual {v6, v7}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_6
    throw v5
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_2
    move-exception v5

    goto :goto_1
.end method

.method private schedulePersistSettings()V
    .locals 2

    .prologue
    .line 738
    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mPersistSettingsScheduled:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 739
    return-void

    .line 741
    :cond_0
    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mPersistSettingsScheduled:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 742
    invoke-static {}, Lcom/android/server/IoThread;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/android/server/om/OverlayManagerService$2;

    invoke-direct {v1, p0}, Lcom/android/server/om/OverlayManagerService$2;-><init>(Lcom/android/server/om/OverlayManagerService;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 737
    return-void
.end method

.method private updateAssets(ILjava/lang/String;)V
    .locals 1
    .param p1, "userId"    # I
    .param p2, "targetPackageName"    # Ljava/lang/String;

    .prologue
    .line 699
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 700
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 701
    invoke-direct {p0, p1, v0}, Lcom/android/server/om/OverlayManagerService;->updateSelectedAssets(ILjava/util/List;)V

    .line 698
    return-void
.end method

.method private updateSelectedAssets(ILjava/util/List;)V
    .locals 12
    .param p1, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 705
    .local p2, "targetPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-class v9, Landroid/content/pm/PackageManagerInternal;

    invoke-static {v9}, Lcom/android/server/LocalServices;->getService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/pm/PackageManagerInternal;

    .line 706
    .local v7, "pm":Landroid/content/pm/PackageManagerInternal;
    const-string/jumbo v9, "android"

    invoke-interface {p2, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v8

    .line 707
    .local v8, "updateFrameworkRes":Z
    if-eqz v8, :cond_0

    .line 708
    invoke-virtual {v7, p1}, Landroid/content/pm/PackageManagerInternal;->getTargetPackageNames(I)Ljava/util/List;

    move-result-object p2

    .line 711
    :cond_0
    new-instance v0, Landroid/util/ArrayMap;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v9

    invoke-direct {v0, v9}, Landroid/util/ArrayMap;-><init>(I)V

    .line 712
    .local v0, "allPaths":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;[Ljava/lang/String;>;"
    iget-object v10, p0, Lcom/android/server/om/OverlayManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v10

    .line 713
    :try_start_0
    iget-object v9, p0, Lcom/android/server/om/OverlayManagerService;->mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

    const-string/jumbo v11, "android"

    invoke-virtual {v9, v11, p1}, Lcom/android/server/om/OverlayManagerServiceImpl;->onGetEnabledOverlayPaths(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v3

    .line 714
    .local v3, "frameworkPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "packageName$iterator":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 715
    .local v4, "packageName":Ljava/lang/String;
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 716
    .local v6, "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v6, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 717
    const-string/jumbo v9, "android"

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 718
    iget-object v9, p0, Lcom/android/server/om/OverlayManagerService;->mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

    invoke-virtual {v9, v4, p1}, Lcom/android/server/om/OverlayManagerServiceImpl;->onGetEnabledOverlayPaths(Ljava/lang/String;I)Ljava/util/List;

    move-result-object v9

    invoke-interface {v6, v9}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 721
    :cond_1
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_2

    const/4 v9, 0x0

    .line 720
    :goto_1
    invoke-interface {v0, v4, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 712
    .end local v3    # "frameworkPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "packageName":Ljava/lang/String;
    .end local v5    # "packageName$iterator":Ljava/util/Iterator;
    .end local v6    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v9

    monitor-exit v10

    throw v9

    .line 721
    .restart local v3    # "frameworkPaths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v4    # "packageName":Ljava/lang/String;
    .restart local v5    # "packageName$iterator":Ljava/util/Iterator;
    .restart local v6    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v9

    new-array v9, v9, [Ljava/lang/String;

    invoke-interface {v6, v9}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    .end local v4    # "packageName":Ljava/lang/String;
    .end local v6    # "paths":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    monitor-exit v10

    .line 725
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 726
    .restart local v4    # "packageName":Ljava/lang/String;
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, [Ljava/lang/String;

    invoke-virtual {v7, p1, v4, v9}, Landroid/content/pm/PackageManagerInternal;->setResourceDirs(ILjava/lang/String;[Ljava/lang/String;)V

    goto :goto_2

    .line 729
    .end local v4    # "packageName":Ljava/lang/String;
    :cond_4
    invoke-static {}, Landroid/app/ActivityManagerNative;->getDefault()Landroid/app/IActivityManager;

    move-result-object v1

    .line 731
    .local v1, "am":Landroid/app/IActivityManager;
    :try_start_2
    invoke-interface {v1, p1, p2}, Landroid/app/IActivityManager;->updateAssets(ILjava/util/List;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_0

    .line 704
    :goto_3
    return-void

    .line 732
    :catch_0
    move-exception v2

    .local v2, "e":Landroid/os/RemoteException;
    goto :goto_3
.end method


# virtual methods
.method public getEnabledOverlayPaths(Ljava/lang/String;I)Ljava/util/List;
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "userId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 272
    iget-object v1, p0, Lcom/android/server/om/OverlayManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 273
    :try_start_0
    iget-object v0, p0, Lcom/android/server/om/OverlayManagerService;->mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/om/OverlayManagerServiceImpl;->onGetEnabledOverlayPaths(Ljava/lang/String;I)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    return-object v0

    .line 272
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public onStart()V
    .locals 0

    .prologue
    .line 255
    return-void
.end method

.method public onSwitchUser(I)V
    .locals 3
    .param p1, "newUserId"    # I

    .prologue
    .line 264
    iget-object v2, p0, Lcom/android/server/om/OverlayManagerService;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 265
    :try_start_0
    iget-object v1, p0, Lcom/android/server/om/OverlayManagerService;->mImpl:Lcom/android/server/om/OverlayManagerServiceImpl;

    invoke-virtual {v1, p1}, Lcom/android/server/om/OverlayManagerServiceImpl;->onSwitchUser(I)Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .local v0, "targets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    monitor-exit v2

    .line 267
    invoke-direct {p0, p1, v0}, Lcom/android/server/om/OverlayManagerService;->updateSelectedAssets(ILjava/util/List;)V

    .line 260
    return-void

    .line 264
    .end local v0    # "targets":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v1

    monitor-exit v2

    throw v1
.end method