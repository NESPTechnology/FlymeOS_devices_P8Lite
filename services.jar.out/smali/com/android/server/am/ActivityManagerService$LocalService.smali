.class final Lcom/android/server/am/ActivityManagerService$LocalService;
.super Landroid/app/ActivityManagerInternal;
.source "ActivityManagerService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/server/am/ActivityManagerService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "LocalService"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/server/am/ActivityManagerService;


# direct methods
.method private constructor <init>(Lcom/android/server/am/ActivityManagerService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    .line 22081
    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-direct {p0}, Landroid/app/ActivityManagerInternal;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/ActivityManagerService$LocalService;)V
    .locals 0
    .param p1, "this$0"    # Lcom/android/server/am/ActivityManagerService;

    .prologue
    invoke-direct {p0, p1}, Lcom/android/server/am/ActivityManagerService$LocalService;-><init>(Lcom/android/server/am/ActivityManagerService;)V

    return-void
.end method


# virtual methods
.method public acquireSleepToken(Ljava/lang/String;)Landroid/app/ActivityManagerInternal$SleepToken;
    .locals 3
    .param p1, "tag"    # Ljava/lang/String;

    .prologue
    .line 22110
    invoke-static {p1}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22112
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22113
    new-instance v0, Lcom/android/server/am/ActivityManagerService$SleepTokenImpl;

    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-direct {v0, v1, p1}, Lcom/android/server/am/ActivityManagerService$SleepTokenImpl;-><init>(Lcom/android/server/am/ActivityManagerService;Ljava/lang/String;)V

    .line 22114
    .local v0, "token":Lcom/android/server/am/ActivityManagerService$SleepTokenImpl;
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v1, v1, Lcom/android/server/am/ActivityManagerService;->mSleepTokens:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 22115
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v1}, Lcom/android/server/am/ActivityManagerService;->updateSleepIfNeededLocked()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v2

    .line 22112
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22116
    return-object v0

    .line 22112
    .end local v0    # "token":Lcom/android/server/am/ActivityManagerService$SleepTokenImpl;
    :catchall_0
    move-exception v1

    monitor-exit v2

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v1
.end method

.method public checkContentProviderAccess(Ljava/lang/String;I)Ljava/lang/String;
    .locals 1
    .param p1, "authority"    # Ljava/lang/String;
    .param p2, "userId"    # I

    .prologue
    .line 22093
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0, p1, p2}, Lcom/android/server/am/ActivityManagerService;->checkContentProviderAccess(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHomeActivityForUser(I)Landroid/content/ComponentName;
    .locals 4
    .param p1, "userId"    # I

    .prologue
    const/4 v1, 0x0

    .line 22122
    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v2

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22123
    iget-object v3, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v3, v3, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-virtual {v3, p1}, Lcom/android/server/am/ActivityStackSupervisor;->getHomeActivityForUser(I)Lcom/android/server/am/ActivityRecord;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 22124
    .local v0, "homeActivity":Lcom/android/server/am/ActivityRecord;
    if-nez v0, :cond_0

    :goto_0
    monitor-exit v2

    .line 22122
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22124
    return-object v1

    :cond_0
    :try_start_1
    iget-object v1, v0, Lcom/android/server/am/ActivityRecord;->realActivity:Landroid/content/ComponentName;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 22122
    .end local v0    # "homeActivity":Lcom/android/server/am/ActivityRecord;
    :catchall_0
    move-exception v1

    monitor-exit v2

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v1
.end method

.method public getTopVisibleActivities()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/os/IBinder;",
            ">;"
        }
    .end annotation

    .prologue
    .line 22174
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22175
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityStackSupervisor;->getTopVisibleActivities()Ljava/util/List;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit v1

    .line 22174
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22175
    return-object v0

    .line 22174
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public getUidProcessState(I)I
    .locals 1
    .param p1, "uid"    # I

    .prologue
    .line 22264
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityManagerService;->getUidState(I)I

    move-result v0

    return v0
.end method

.method public grantUriPermissionFromIntent(ILjava/lang/String;Landroid/content/Intent;I)V
    .locals 7
    .param p1, "callingUid"    # I
    .param p2, "targetPkg"    # Ljava/lang/String;
    .param p3, "intent"    # Landroid/content/Intent;
    .param p4, "targetUserId"    # I

    .prologue
    .line 22085
    iget-object v6, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v6

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22086
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    .line 22087
    const/4 v4, 0x0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    .line 22086
    invoke-virtual/range {v0 .. v5}, Lcom/android/server/am/ActivityManagerService;->grantUriPermissionFromIntentLocked(ILjava/lang/String;Landroid/content/Intent;Lcom/android/server/am/UriPermissionOwner;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v6

    .line 22085
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22084
    return-void

    .line 22085
    :catchall_0
    move-exception v0

    monitor-exit v6

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public killForegroundAppsForUser(I)V
    .locals 16
    .param p1, "userHandle"    # I

    .prologue
    .line 22188
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v11

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22189
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 22190
    .local v9, "procs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v10, v10, Lcom/android/server/am/ActivityManagerService;->mProcessNames:Lcom/android/internal/app/ProcessMap;

    invoke-virtual {v10}, Lcom/android/internal/app/ProcessMap;->getMap()Landroid/util/ArrayMap;

    move-result-object v10

    invoke-virtual {v10}, Landroid/util/ArrayMap;->size()I

    move-result v3

    .line 22191
    .local v3, "NP":I
    const/4 v8, 0x0

    .local v8, "ip":I
    :goto_0
    if-ge v8, v3, :cond_4

    .line 22192
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v10, v10, Lcom/android/server/am/ActivityManagerService;->mProcessNames:Lcom/android/internal/app/ProcessMap;

    invoke-virtual {v10}, Lcom/android/internal/app/ProcessMap;->getMap()Landroid/util/ArrayMap;

    move-result-object v10

    invoke-virtual {v10, v8}, Landroid/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/util/SparseArray;

    .line 22193
    .local v5, "apps":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/android/server/am/ProcessRecord;>;"
    invoke-virtual {v5}, Landroid/util/SparseArray;->size()I

    move-result v2

    .line 22194
    .local v2, "NA":I
    const/4 v7, 0x0

    .local v7, "ia":I
    :goto_1
    if-ge v7, v2, :cond_3

    .line 22195
    invoke-virtual {v5, v7}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/android/server/am/ProcessRecord;

    .line 22196
    .local v4, "app":Lcom/android/server/am/ProcessRecord;
    iget-boolean v10, v4, Lcom/android/server/am/ProcessRecord;->persistent:Z

    if-eqz v10, :cond_1

    .line 22194
    :cond_0
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 22200
    :cond_1
    iget-boolean v10, v4, Lcom/android/server/am/ProcessRecord;->removed:Z

    if-eqz v10, :cond_2

    .line 22201
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    .line 22188
    .end local v2    # "NA":I
    .end local v3    # "NP":I
    .end local v4    # "app":Lcom/android/server/am/ProcessRecord;
    .end local v5    # "apps":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/android/server/am/ProcessRecord;>;"
    .end local v7    # "ia":I
    .end local v8    # "ip":I
    .end local v9    # "procs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    :catchall_0
    move-exception v10

    monitor-exit v11

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v10

    .line 22202
    .restart local v2    # "NA":I
    .restart local v3    # "NP":I
    .restart local v4    # "app":Lcom/android/server/am/ProcessRecord;
    .restart local v5    # "apps":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/android/server/am/ProcessRecord;>;"
    .restart local v7    # "ia":I
    .restart local v8    # "ip":I
    .restart local v9    # "procs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/server/am/ProcessRecord;>;"
    :cond_2
    :try_start_1
    iget v10, v4, Lcom/android/server/am/ProcessRecord;->userId:I

    move/from16 v0, p1

    if-ne v10, v0, :cond_0

    iget-boolean v10, v4, Lcom/android/server/am/ProcessRecord;->foregroundActivities:Z

    if-eqz v10, :cond_0

    .line 22203
    const/4 v10, 0x1

    iput-boolean v10, v4, Lcom/android/server/am/ProcessRecord;->removed:Z

    .line 22204
    invoke-virtual {v9, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 22191
    .end local v4    # "app":Lcom/android/server/am/ProcessRecord;
    :cond_3
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 22209
    .end local v2    # "NA":I
    .end local v5    # "apps":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/android/server/am/ProcessRecord;>;"
    .end local v7    # "ia":I
    :cond_4
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v1

    .line 22210
    .local v1, "N":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_3
    if-ge v6, v1, :cond_5

    .line 22211
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v9, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/android/server/am/ProcessRecord;

    const-string/jumbo v13, "kill all fg"

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-virtual {v12, v10, v14, v15, v13}, Lcom/android/server/am/ActivityManagerService;->removeProcessLocked(Lcom/android/server/am/ProcessRecord;ZZLjava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22210
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    :cond_5
    monitor-exit v11

    .line 22188
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22187
    return-void
.end method

.method public notifyAppTransitionCancelled()V
    .locals 2

    .prologue
    .line 22167
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22168
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityStackSupervisor;->notifyAppTransitionDone()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22167
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22166
    return-void

    .line 22167
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public notifyAppTransitionFinished()V
    .locals 2

    .prologue
    .line 22160
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22161
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityStackSupervisor;->notifyAppTransitionDone()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22160
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22159
    return-void

    .line 22160
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public notifyAppTransitionStarting(I)V
    .locals 2
    .param p1, "reason"    # I

    .prologue
    .line 22153
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22154
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v0, Lcom/android/server/am/ActivityStackSupervisor;->mActivityMetricsLogger:Lcom/android/server/am/ActivityMetricsLogger;

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityMetricsLogger;->notifyTransitionStarting(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22153
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22152
    return-void

    .line 22153
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public notifyDockedStackMinimizedChanged(Z)V
    .locals 2
    .param p1, "minimized"    # Z

    .prologue
    .line 22181
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22182
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityStackSupervisor;->setDockedStackMinimized(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22181
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22180
    return-void

    .line 22181
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public notifyStartingWindowDrawn()V
    .locals 2

    .prologue
    .line 22146
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22147
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v0, v0, Lcom/android/server/am/ActivityManagerService;->mStackSupervisor:Lcom/android/server/am/ActivityStackSupervisor;

    iget-object v0, v0, Lcom/android/server/am/ActivityStackSupervisor;->mActivityMetricsLogger:Lcom/android/server/am/ActivityMetricsLogger;

    invoke-virtual {v0}, Lcom/android/server/am/ActivityMetricsLogger;->notifyStartingWindowDrawn()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22146
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22145
    return-void

    .line 22146
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public onLocalVoiceInteractionStarted(Landroid/os/IBinder;Landroid/service/voice/IVoiceInteractionSession;Lcom/android/internal/app/IVoiceInteractor;)V
    .locals 2
    .param p1, "activity"    # Landroid/os/IBinder;
    .param p2, "voiceSession"    # Landroid/service/voice/IVoiceInteractionSession;
    .param p3, "voiceInteractor"    # Lcom/android/internal/app/IVoiceInteractor;

    .prologue
    .line 22138
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22139
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0, p1, p2, p3}, Lcom/android/server/am/ActivityManagerService;->onLocalVoiceInteractionStartedLocked(Landroid/os/IBinder;Landroid/service/voice/IVoiceInteractionSession;Lcom/android/internal/app/IVoiceInteractor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22138
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22137
    return-void

    .line 22138
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public onUserRemoved(I)V
    .locals 2
    .param p1, "userId"    # I

    .prologue
    .line 22130
    iget-object v1, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v1

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22131
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityManagerService;->onUserStoppedLocked(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    .line 22130
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22129
    return-void

    .line 22130
    :catchall_0
    move-exception v0

    monitor-exit v1

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method

.method public onWakefulnessChanged(I)V
    .locals 1
    .param p1, "wakefulness"    # I

    .prologue
    .line 22098
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    invoke-virtual {v0, p1}, Lcom/android/server/am/ActivityManagerService;->onWakefulnessChanged(I)V

    .line 22097
    return-void
.end method

.method public setPendingIntentWhitelistDuration(Landroid/content/IIntentSender;J)V
    .locals 4
    .param p1, "target"    # Landroid/content/IIntentSender;
    .param p2, "duration"    # J

    .prologue
    .line 22218
    instance-of v0, p1, Lcom/android/server/am/PendingIntentRecord;

    if-nez v0, :cond_0

    .line 22219
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->-get0()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "markAsSentFromNotification(): not a PendingIntentRecord: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Slog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22220
    return-void

    .line 22222
    :cond_0
    check-cast p1, Lcom/android/server/am/PendingIntentRecord;

    .end local p1    # "target":Landroid/content/IIntentSender;
    invoke-virtual {p1, p2, p3}, Lcom/android/server/am/PendingIntentRecord;->setWhitelistDuration(J)V

    .line 22217
    return-void
.end method

.method public startActivitiesAsPackage(Ljava/lang/String;I[Landroid/content/Intent;Landroid/os/Bundle;)I
    .locals 11
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "userId"    # I
    .param p3, "intents"    # [Landroid/content/Intent;
    .param p4, "bOptions"    # Landroid/os/Bundle;

    .prologue
    .line 22239
    const-string/jumbo v0, "intents"

    invoke-static {p3, v0}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22240
    array-length v0, p3

    new-array v4, v0, [Ljava/lang/String;

    .line 22241
    .local v4, "resolvedTypes":[Ljava/lang/String;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    array-length v0, p3

    if-ge v9, v0, :cond_0

    .line 22242
    aget-object v0, p3, v9

    iget-object v2, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    iget-object v2, v2, Lcom/android/server/am/ActivityManagerService;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v4, v9

    .line 22241
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 22248
    :cond_0
    const/4 v1, 0x0

    .line 22250
    .local v1, "packageUid":I
    :try_start_0
    invoke-static {}, Landroid/app/AppGlobals;->getPackageManager()Landroid/content/pm/IPackageManager;

    move-result-object v0

    .line 22251
    const/high16 v2, 0x10000000

    .line 22250
    invoke-interface {v0, p1, v2, p2}, Landroid/content/pm/IPackageManager;->getPackageUid(Ljava/lang/String;II)I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 22256
    :goto_1
    iget-object v10, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v10

    :try_start_1
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22257
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    .line 22258
    const/4 v5, 0x0

    move-object v2, p1

    move-object v3, p3

    move-object v6, p4

    move v7, p2

    .line 22257
    invoke-virtual/range {v0 .. v7}, Lcom/android/server/am/ActivityManagerService;->startActivitiesInPackage(ILjava/lang/String;[Landroid/content/Intent;[Ljava/lang/String;Landroid/os/IBinder;Landroid/os/Bundle;I)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v0

    monitor-exit v10

    .line 22256
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22257
    return v0

    .line 22256
    :catchall_0
    move-exception v0

    monitor-exit v10

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0

    .line 22252
    :catch_0
    move-exception v8

    .local v8, "e":Landroid/os/RemoteException;
    goto :goto_1
.end method

.method public startIsolatedProcess(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Runnable;)I
    .locals 7
    .param p1, "entryPoint"    # Ljava/lang/String;
    .param p2, "entryPointArgs"    # [Ljava/lang/String;
    .param p3, "processName"    # Ljava/lang/String;
    .param p4, "abiOverride"    # Ljava/lang/String;
    .param p5, "uid"    # I
    .param p6, "crashHandler"    # Ljava/lang/Runnable;

    .prologue
    .line 22104
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/android/server/am/ActivityManagerService;->startIsolatedProcess(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Runnable;)I

    move-result v0

    return v0
.end method

.method public updatePersistentConfigurationForUser(Landroid/content/res/Configuration;I)V
    .locals 8
    .param p1, "values"    # Landroid/content/res/Configuration;
    .param p2, "userId"    # I

    .prologue
    .line 22228
    const-string/jumbo v0, "Configuration must not be null"

    invoke-static {p1, v0}, Lcom/android/internal/util/Preconditions;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22229
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "userId "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " not supported"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/android/internal/util/Preconditions;->checkArgumentNonnegative(ILjava/lang/String;)I

    .line 22230
    iget-object v7, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    monitor-enter v7

    :try_start_0
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->boostPriorityForLockedSection()V

    .line 22231
    iget-object v0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 22232
    const/4 v6, 0x0

    move-object v1, p1

    move v5, p2

    .line 22231
    invoke-static/range {v0 .. v6}, Lcom/android/server/am/ActivityManagerService;->-wrap3(Lcom/android/server/am/ActivityManagerService;Landroid/content/res/Configuration;Lcom/android/server/am/ActivityRecord;ZZIZ)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v7

    .line 22230
    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    .line 22227
    return-void

    .line 22230
    :catchall_0
    move-exception v0

    monitor-exit v7

    invoke-static {}, Lcom/android/server/am/ActivityManagerService;->resetPriorityAfterLockedSection()V

    throw v0
.end method
