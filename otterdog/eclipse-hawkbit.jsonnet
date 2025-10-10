local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('iot.hawkbit', 'eclipse-hawkbit') {
  settings+: {
    blog: "https://eclipse.dev/hawkbit/",
    description: "",
    name: "Eclipse hawkBit",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },  secrets+: [
    orgs.newOrgSecret('GITLAB_API_TOKEN') {
      value: "pass:bots/iot.hawkbit/gitlab.eclipse.org/api-token",
    },
    orgs.newOrgSecret('GPG_KEY_ID') {
      value: "pass:bots/iot.hawkbit/gpg/key_id",
    },
    orgs.newOrgSecret('GPG_PASSPHRASE') {
      value: "pass:bots/iot.hawkbit/gpg/passphrase",
    },
    orgs.newOrgSecret('GPG_PRIVATE_KEY') {
      value: "pass:bots/iot.hawkbit/gpg/secret-subkeys.asc",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_PASSWORD') {
      value: "pass:bots/iot.hawkbit/central.sonatype.org/token-password",
    },
    orgs.newOrgSecret('CENTRAL_SONATYPE_TOKEN_USERNAME') {
      value: "pass:bots/iot.hawkbit/central.sonatype.org/token-username",
    },
  ],
  _repositories+:: [
    orgs.newRepo('hawkbit') {
      allow_merge_commit: true,
      allow_update_branch: false,
      code_scanning_default_languages+: [
        "actions",
        "javascript-typescript",
      ],
      code_scanning_default_setup_enabled: true,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse hawkBit™",
      homepage: "https://projects.eclipse.org/projects/iot.hawkbit",
      gh_pages_build_type: "legacy",
      gh_pages_source_branch: "master",
      gh_pages_source_path: "/docs",
      environments: [
        orgs.newEnvironment('github-pages'),
      ],
      topics+: [
        "eclipseiot",
        "internet-of-things",
        "iot",
        "software-provisioning"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      secrets: [
        orgs.newRepoSecret('PAT_SECRET') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "pass:bots/iot.hawkbit/sonarcloud.io/token-hawkbit",
        },
      ],
      variables: [
        orgs.newRepoVariable('SONAR_ORGANIZATION') {
          value: "eclipse-hawkbit",
        },
        orgs.newRepoVariable('SONAR_PROJECT_KEY') {
          value: "eclipse-hawkbit_hawkbit",
        },
      ],

    },
    orgs.newRepo('hawkbit-clients-golang') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "Golang Client SDK for the Eclipse hawkBit Project",
      web_commit_signoff_required: false,
    },
    orgs.newRepo('hawkbit-examples') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://circleci.com/hooks/github') {
          events+: [
            "commit_comment",
            "create",
            "delete",
            "fork",
            "gollum",
            "issue_comment",
            "issues",
            "member",
            "public",
            "pull_request",
            "pull_request_review_comment",
            "push",
            "release",
            "status",
            "team_add",
            "watch"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('PAT_SECRET') {
          value: "********",
        },
        orgs.newRepoSecret('SONARCLOUD_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('hawkbit-extensions') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
      webhooks: [
        orgs.newRepoWebhook('https://circleci.com/hooks/github') {
          events+: [
            "commit_comment",
            "create",
            "delete",
            "fork",
            "gollum",
            "issue_comment",
            "issues",
            "member",
            "public",
            "pull_request",
            "pull_request_review_comment",
            "push",
            "release",
            "status",
            "team_add",
            "watch"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('PAT_SECRET') {
          value: "********",
        },
        orgs.newRepoSecret('SONARCLOUD_TOKEN') {
          value: "********",
        },
      ],
    },
    orgs.newRepo('hawkbit-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      default_branch: "master",
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: false,
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}