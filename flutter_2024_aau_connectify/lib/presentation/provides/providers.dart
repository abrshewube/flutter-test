import 'package:flutter_2024_aau_connectify/presentation/service/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Provider for AuthService
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// StateNotifier for checking student existence
final studentExistenceController = StateNotifierProvider.autoDispose<CheckStudentExistenceNotifier, bool>((ref) {
  return CheckStudentExistenceNotifier(ref.read(authServiceProvider));
});

class CheckStudentExistenceNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  CheckStudentExistenceNotifier(this._authService) : super(false);

  Future<void> checkStudentExistence(String studentId, String studentPassword) async {
    try {
      final studentExists = await _authService.checkStudentExistence(studentId, studentPassword);
      state = studentExists;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for user registration
final userRegistrationController = StateNotifierProvider.autoDispose<UserRegistrationNotifier, bool>((ref) {
  return UserRegistrationNotifier(ref.read(authServiceProvider));
});

class UserRegistrationNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  UserRegistrationNotifier(this._authService) : super(false);

  Future<void> registerUser(String fullName, String email, String password, String studentId, String studentPassword) async {
    try {
      final success = await _authService.registerUser(fullName, email, password, studentId, studentPassword);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for email verification
final emailVerificationController = StateNotifierProvider.autoDispose<EmailVerificationNotifier, bool>((ref) {
  return EmailVerificationNotifier(ref.read(authServiceProvider));
});

class EmailVerificationNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  EmailVerificationNotifier(this._authService) : super(false);

  Future<void> verifyEmail(String email, String code) async {
    try {
      final success = await _authService.verifyEmail(email, code);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}



final userLoginController = StateNotifierProvider.autoDispose<UserLoginNotifier, bool>((ref) {
  return UserLoginNotifier(ref.read(authServiceProvider));
});

class UserLoginNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  UserLoginNotifier(this._authService) : super(false);

  Future<bool> loginUser(String email, String password) async {
    try {
      final success = await _authService.loginUser(email, password);
      state = success; // Assuming success is a bool returned by _authService.loginUser
      return success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
      return false; // or throw an exception
    }
  }
}


// StateNotifier for getting all announcements with pagination
final announcementsController = StateNotifierProvider.autoDispose<AnnouncementsNotifier, List<dynamic>>((ref) {
  return AnnouncementsNotifier(ref.read(authServiceProvider));
});

class AnnouncementsNotifier extends StateNotifier<List<dynamic>> {
  final AuthService _authService;

  AnnouncementsNotifier(this._authService) : super([]);

  Future<void> getAnnouncements(int page, int limit) async {
    try {
      final announcements = await _authService.getAnnouncements(page, limit);
      state = announcements;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for getting an announcement by ID
final announcementByIdController = StateNotifierProvider.autoDispose<AnnouncementByIdNotifier, Map<String, dynamic>>((ref) {
  return AnnouncementByIdNotifier(ref.read(authServiceProvider));
});

class AnnouncementByIdNotifier extends StateNotifier<Map<String, dynamic>> {
  final AuthService _authService;

  AnnouncementByIdNotifier(this._authService) : super({});

  Future<void> getAnnouncementById(String id) async {
    try {
      final announcement = await _authService.getAnnouncementById(id);
      state = announcement;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for creating a new announcement
final createAnnouncementController = StateNotifierProvider.autoDispose<CreateAnnouncementNotifier, bool>((ref) {
  return CreateAnnouncementNotifier(ref.read(authServiceProvider));
});

class CreateAnnouncementNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  CreateAnnouncementNotifier(this._authService) : super(false);

  Future<void> createAnnouncement(String title, String content, String category, String summary, DateTime date, String image, String tag) async {
    try {
      final success = await _authService.createAnnouncement(title, content, category, summary, date, image, tag);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for updating an announcement by ID
final updateAnnouncementController = StateNotifierProvider.autoDispose<UpdateAnnouncementNotifier, bool>((ref) {
  return UpdateAnnouncementNotifier(ref.read(authServiceProvider));
});

class UpdateAnnouncementNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  UpdateAnnouncementNotifier(this._authService) : super(false);

  Future<void> updateAnnouncement(String id, String title, String content, String category, String summary, DateTime date, String image, String tag) async {
    try {
      final success = await _authService.updateAnnouncement(id, title, content, category, summary, date, image, tag);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for deleting an announcement by ID
final deleteAnnouncementController = StateNotifierProvider.autoDispose<DeleteAnnouncementNotifier, bool>((ref) {
  return DeleteAnnouncementNotifier(ref.read(authServiceProvider));
});

class DeleteAnnouncementNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  DeleteAnnouncementNotifier(this._authService) : super(false);

  Future<void> deleteAnnouncement(String id) async {
    try {
      final success = await _authService.deleteAnnouncement(id);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for creating a new comment
final createCommentController = StateNotifierProvider.autoDispose<CreateCommentNotifier, bool>((ref) {
  return CreateCommentNotifier(ref.read(authServiceProvider));
});

class CreateCommentNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  CreateCommentNotifier(this._authService) : super(false);

  Future<void> createComment(String content, String userId, String announcementId) async {
    try {
      final success = await _authService.createComment(content, userId, announcementId);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for getting all comments by announcement ID
final commentsByAnnouncementController = StateNotifierProvider.autoDispose<CommentsByAnnouncementNotifier, List<dynamic>>((ref) {
  return CommentsByAnnouncementNotifier(ref.read(authServiceProvider));
});

class CommentsByAnnouncementNotifier extends StateNotifier<List<dynamic>> {
  final AuthService _authService;

  CommentsByAnnouncementNotifier(this._authService) : super([]);

  Future<void> getCommentsByAnnouncementId(String announcementId) async {
    try {
      final comments = await _authService.getCommentsByAnnouncementId(announcementId);
      state = comments;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for getting a comment by ID
final commentByIdController = StateNotifierProvider.autoDispose<CommentByIdNotifier, Map<String, dynamic>>((ref) {
  return CommentByIdNotifier(ref.read(authServiceProvider));
});

class CommentByIdNotifier extends StateNotifier<Map<String, dynamic>> {
  final AuthService _authService;

  CommentByIdNotifier(this._authService) : super({});

  Future<void> getCommentById(String id) async {
    try {
      final comment = await _authService.getCommentById(id);
      state = comment;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for updating a comment by ID
final updateCommentController = StateNotifierProvider.autoDispose<UpdateCommentNotifier, bool>((ref) {
  return UpdateCommentNotifier(ref.read(authServiceProvider));
});

class UpdateCommentNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  UpdateCommentNotifier(this._authService) : super(false);

  Future<void> updateComment(String id, String content, String userId, String announcementId) async {
    try {
      final success = await _authService.updateComment(id, content, userId, announcementId);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}

// StateNotifier for deleting a comment by ID
final deleteCommentController = StateNotifierProvider.autoDispose<DeleteCommentNotifier, bool>((ref) {
  return DeleteCommentNotifier(ref.read(authServiceProvider));
});

class DeleteCommentNotifier extends StateNotifier<bool> {
  final AuthService _authService;

  DeleteCommentNotifier(this._authService) : super(false);

  Future<void> deleteComment(String id) async {
    try {
      final success = await _authService.deleteComment(id);
      state = success;
    } catch (e) {
      // Handle errors
      print('Error: $e');
    }
  }
}
